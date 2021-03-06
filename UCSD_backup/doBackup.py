#!/usr/bin/python
#
# Name: doBackup.py
# Author: Alejandro Madurga (almadurg@cisco.com)
# Date: 17th November 2015
# Versions:
#	0.1 Initial Version 10th November 2015
#	1.0 Changed stop DB logic, not necessary
#
# UCSD Version: 5.3.1.2
# 
# Description:
# 	This script executes the backup on a multi node deployment.
# 	To be able to run properly, the root account should be enabled on the remote nodes using
#	ssh keys.
# INPUTS:
# 	None, the inputs are read from the backupConfig.py file
# OUTPUTS:
#  The backup script left a logfile on the same directory than the script called
#  doBackup.log
#
# IMPORTS

import optparse
import logging
import logging.handlers
import subprocess
import sys
import os


# IMPORT the settings for the UCSD Multinode Setup
import backupConfig



def main():
	
	#Create the help for the script
	parser = optparse.OptionParser(description="""This script execute the backup procedure on a UCSD Multi node Environment.""" + \
	"""It reads the configuration info from the backupConfig.py file. If the file does not exit it will fail.""")
	args=parser.parse_args()
	
	#Initialize the logger
	logFormatter = logging.Formatter("%(asctime)s [%(threadName)-12.12s] [%(levelname)-5.5s]  %(message)s")
	rootLogger = logging.getLogger("file_logger")
	screenLogger = logging.getLogger("screen_logger")
	#Rotate the logs up to 5 files, 1 Mb each.
	fileHandler = logging.handlers.RotatingFileHandler("doBackup.log", maxBytes=1*1024*1024, backupCount=5,mode='a', encoding=None)
	fileHandler.setFormatter(logFormatter)
	rootLogger.addHandler(fileHandler)
	consoleHandler = logging.StreamHandler()
	consoleHandler.setFormatter(logFormatter)
	screenLogger.addHandler(consoleHandler)
	rootLogger.setLevel(20);
	rootLogger.info("#################################################################")
	rootLogger.info("############          BACKUP STARTING          ##################")
	rootLogger.info("#################################################################")
	#Now check the existence of the configuration variables
	try:
		primaryNode = backupConfig.PrimaryNode
		inventoryDB = backupConfig.InventoryDB
		# monitoringDB = backupConfig.MonitoringDB
		# serviceNodes = backupConfig.ServiceNodes
		backupPath = backupConfig.BackupPath
	except AttributeError:
		rootLogger.error("Parameter missing on backupConfig.py file, please review the parameters on that file.")
		screenLogger.error("Parameter missing on backupConfig.py file, please review the parameters on that file.")
		sys.exit(1)
	#Service nodes can ba optional, it will put a warning message on the log if there is no one.
	if len(serviceNodes)== 0:
		rootLogger.warning("No service nodes defined on the config file, skipping service nodes shutdown")
	else:
		# Shutdown all service nodes, if one of them fails, it will log and error and continue
		# because the service nodes are not critical.
		rootLogger.info("Shutting down all service nodes.")
		for node in serviceNodes:
			rootLogger.info("Shutting down Service Node %s" % node)
			try:
				p = subprocess.Popen(['ssh', node ,'/opt/infra/stopInfraAll.sh'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
				output, err = p.communicate()
				rc = p.returncode
			except Exception,e:
				rootLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,e))
				screenLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,e))
			if rc > 0:
				rootLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,err))
				screenLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,err))
	#Now shutdown the Primary node, which is critical.
	rootLogger.info("Shutting down the Primary Node %s" % primaryNode)
	#In case of Primary Node error stop there, something is wrong on a critical component.
	try:
		p = subprocess.Popen(['/opt/infra/stopInfraAll.sh'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = p.returncode
	except Exception,e:
		rootLogger.error("Unable to shutdown the Primary Node: %s, reason: %s" % (primaryNode,e))
		screenLogger.error("Unable to shutdown the Primary Node: %s, reason: %s" % (primaryNode,e))
		sys.exit(1)
	if rc > 0:
		rootLogger.error("Unable to shutdown the Primary  Node: %s, reason: %s" % (primaryNode,err))
		screenLogger.error("Unable to shutdown the Primary  Node: %s, reason: %s" % (primaryNode,err))
		sys.exit(1)
	rootLogger.info("Primary Node shutted down successfully.")
	
	rootLogger.info("Backing up the Inventory DB %s on path: %s" % (inventoryDB,backupPath))
	# try to backup the Inventory DB, if there is a problem with the backup, log and error and continue
	# we don't want to left the infra shutted down.
	try:
		p = subprocess.Popen(['ssh',inventoryDB,'mkdir','-p',backupPath], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = p.returncode
		p = subprocess.Popen(['ssh',inventoryDB,'/opt/infra/dbInfraBackupRestore.sh','backup'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = rc + p.returncode
		p = subprocess.Popen(['ssh',inventoryDB,'mv','/tmp/infra_database_backup.tar.gz' ,backupPath + "/cuic_inventory_backup_`date '+%m-%d-%Y-%H-%M-%S'`.tar.gz"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = rc + p.returncode
	except Exception,e:
		rootLogger.error("Unable to backup the Inventory DB: %s, reason: %s" % (inventoryDB,e))
		screenLogger.error("Unable to backup the Inventory DB %s, reason: %s" % (inventoryDB,e))
	if rc > 0:
		rootLogger.error("Unable to backup the Inventory DB: %s, reason: %s" % (inventoryDB,err))
		screenLogger.error("Unable to backup the Inventory DB: %s, reason: %s" % (inventoryDB,err))
	else:
		rootLogger.info("Inventory DB backed up successfully.")
	rootLogger.info("Backing up the Monitoring DB %s on path: %s" % (monitoringDB,backupPath))
	# Now try to backup the monitoring DB, in case of error, log it and continue
	# try:
	# 	p = subprocess.Popen(['ssh',monitoringDB,'mkdir','-p',backupPath], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	rc = p.returncode
	# 	p = subprocess.Popen(['ssh',monitoringDB,'/opt/infra/dbMonitoringBackupRestore.sh','backup'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	rc = rc + p.returncode
	# 	p = subprocess.Popen(['ssh',monitoringDB,'mv','/tmp/monitoring_database_backup.tar.gz' ,backupPath + "/cuic_monitoring_backup_`date '+%m-%d-%Y-%H-%M-%S'`.tar.gz"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	rc = rc + p.returncode
	# except Exception,e:
	# 	rootLogger.error("Unable to backup the Monitoring DB: %s, reason: %s" % (monitoringDB,e))
	# 	screenLogger.error("Unable to backup the Monitoring DB %s, reason: %s" % (monitoringDB,e))
	# if rc > 0:
	# 	rootLogger.error("Unable to backup the Monitoring DB: %s, reason: %s" % (monitoringDB,err))
	# 	screenLogger.error("Unable to backup the Monitoring DB: %s, reason: %s" % (monitoringDB,err))
	# else:
	# 	rootLogger.info("Monitoring DB backed up successfully.")
	# 
	rootLogger.info("Starting the Primary Node %s" % primaryNode)
	# Start the Primary Node, it is a critical component, so it will stop in case of failure
	try:
		p = subprocess.Popen(['nohup','/opt/infra/startInfraAll.sh','&'])
		p.communicate()
				
	except Exception,e:
		rootLogger.error("Unable to start the Primary Node: %s, reason: %s" % (primaryNode,e))
		screenLogger.error("Unable to start the Primary Node: %s, reason: %s" % (primaryNode,e))
		sys.exit(1)
	rootLogger.info("Primary Node Started successfully.")
	# Start the Service Nodes, in case of error, log it and continue, it is not a critical component.
	# if len(serviceNodes)== 0:
	# 	rootLogger.warning("No service nodes defined on the config file, skipping start of service nodes.")
	# else:
	# 	rootLogger.info("Starting all service nodes.")
	# 	for node in serviceNodes:
	# 		rootLogger.info("Starting Service Node %s" % node)
	# 		try:
	# 			os.system("nohup ssh " + node +  " /opt/infra/startInfraAll.sh &2>&1 &")
	# 		except Exception,e:
	# 			rootLogger.error("Unable to start the Service  Node: %s, reason: %s" % (node,e))
	# 			screenLogger.error("Unable to start the Service  Node: %s, reason: %s" % (node,e))
	# 			break;
	# 		rootLogger.info("Service Node %s successfully started." % node)
	rootLogger.info("############         BACKUP SUCESSFULLY ENDED        #####################")
	sys.exit(0)
if __name__ == "__main__":
	main()
