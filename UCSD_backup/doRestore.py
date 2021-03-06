#!/usr/bin/python
#
# Name: doRestore.py
# Author: Alejandro Madurga (almadurg@cisco.com)
# Date: 18th November 2015
# Versions:
#	0.1 Initial Version 
#	
#
# UCSD Version: 5.3.1.2
# 
# Description:
# 	This script executes a restore on a multinode environment
# INPUTS:
# 	invBackup: The backup file name for the inventory database backup, ie: /tmp/backup/
#	monBackup: The backup file name for the monitoring database backup, ie: /tmp/backup/TBD
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
	parser = optparse.OptionParser(description="""This script execute the restore procedure on a UCSD Multi node Environment.""" + \
	"""It reads the configuration info from the backupConfig.py file. If the file does not exit it will fail.""",
	version = "doRestore 1.0",usage = "%prog --invBackup --monBackup")
	parser.add_option("--invBackup", dest="invBackup",help="Filename of the Inventory DB Backup File on the Inventory DB Node", metavar="FILE")
	# parser.add_option("--monBackup", dest="monBackup",help="Filename of the Monitoring DB Backup File on the Monitoring DB Node", metavar="FILE")
	(options,args)=parser.parse_args()
	if not options.invBackup:   # if filename is not given
		parser.error('Missing --invBackup parameter. Use -h option for help')
	# if not options.monBackup: 
	# 	parser.error('Missing --monBackup parameter. Use -h option for help')
	
	#Initialize the logger
	logFormatter = logging.Formatter("%(asctime)s [%(threadName)-12.12s] [%(levelname)-5.5s]  %(message)s")
	rootLogger = logging.getLogger("file_logger")
	#Rotate the logs up to 5 files, 1 Mb each.
	fileHandler = logging.handlers.RotatingFileHandler("doRestore.log", maxBytes=1*1024*1024, backupCount=5,mode='a', encoding=None)
	fileHandler.setFormatter(logFormatter)
	rootLogger.addHandler(fileHandler)
	consoleHandler = logging.StreamHandler()
	consoleHandler.setFormatter(logFormatter)
	rootLogger.addHandler(consoleHandler)
	rootLogger.setLevel(20);
	rootLogger.info("#################################################################")
	rootLogger.info("############          RESTORE STARTING          #################")
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
		sys.exit(1)
	#Ok, lets check the existence of those files on the servers!
	p = subprocess.Popen(['ssh',inventoryDB,'ls',backupPath + "/" + options.invBackup], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	output, err = p.communicate()
	rc = p.returncode
	if rc != 0:
		rootLogger.error("Backup file not found on the Inventory Node, check your inputs.")
		sys.exit(1)
	# p = subprocess.Popen(['ssh',monitoringDB,'ls',backupPath + "/" + options.monBackup], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# output, err = p.communicate()
	# rc = p.returncode
	# if rc != 0:
	# 	rootLogger.error("Backup file not found on the Monitoring Node, check your inputs.")
	# 	sys.exit(1)
	#If we reach this section, that means that the selected backup files exists on the nodes.
	# Copy the files to the restore location /tmp/
	#/tmp/monitoring_database_backup.tar.gz
	rootLogger.info("Copying the Inventory Backup file to the original destination...")
	try:
		p = subprocess.Popen(['ssh',inventoryDB,'\cp','-r',backupPath + "/" + options.invBackup,"/tmp/infra_database_backup.tar.gz"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = p.returncode
				
	except Exception as e:
		rootLogger.error("Unable to copy the Inventory DB File to the original location: %s" % e)
		sys.exit(1)
	if rc > 0:
		rootLogger.error("Unable to copy the Inventory DB File to the original location: %s" % err)
		sys.exit(1)
	else:
		rootLogger.info("Inventory DB backup file copied to original directory(/tmp/infra_database_backup.tar.gz) successfully.")
	rootLogger.info("Copying the Monitoring Backup file to the original destination...")
	# try:
	# 	p = subprocess.Popen(['ssh',monitoringDB,'\cp','-r',backupPath + "/" + options.monBackup,"/tmp/monitoring_database_backup.tar.gz"], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	rc = p.returncode
	# 			
	# except Exception,e:
	# 	rootLogger.error("Unable to copy the Monitoring DB File to the original location: %s" % e)
	# 	sys.exit(1)
	# if rc > 0:
	# 	rootLogger.error("Unable to copy the Monitoring DB File to the original location: %s" % err)
	# 	sys.exit(1)
	# else:
	# 	rootLogger.info("Monitoring DB backup file copied to original directory(/tmp/monitoring_database_backup.tar.gz) successfully.")
    # 
	#No proceed to the shutdown
	#Service nodes can be optional, it will put a warning message on the log if there is no one.
	# if len(serviceNodes)== 0:
	# 	rootLogger.warning("No service nodes defined on the config file, skipping service nodes shutdown")
	# else:
	# 	# Shutdown all service nodes, if one of them fails, it will log and error and continue
	# 	# because the service nodes are not critical.
	# 	rootLogger.info("Shutting down all service nodes.")
	# 	for node in serviceNodes:
	# 		rootLogger.info("Shutting down Service Node %s" % node)
	# 		try:
	# 			p = subprocess.Popen(['ssh', node ,'/opt/infra/stopInfraAll.sh'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 			output, err = p.communicate()
	# 			rc = p.returncode
	# 		except Exception,e:
	# 			rootLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,e))
	# 		if rc > 0:
	# 			rootLogger.error("Unable to shutdown the Service  Node: %s, reason: %s" % (node,err))
	# 		#Now shutdown the Primary node, which is critical.
	rootLogger.info("Shutting down the Primary Node %s" % primaryNode)
	#In case of Primary Node error stop there, something is wrong on a critical component.
	try:
		p = subprocess.Popen(['/opt/infra/stopInfraAll.sh'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = p.returncode
	except Exception as e:
		rootLogger.error("Unable to shutdown the Primary Node: %s, reason: %s" % (primaryNode,e))
		sys.exit(1)
	if rc > 0:
		rootLogger.error("Unable to shutdown the Primary  Node: %s, reason: %s" % (primaryNode,err))
		sys.exit(1)
	rootLogger.info("Primary Node shutted down successfully.")
	rootLogger.info("Restoring the Inventory DB.")
	# try to Restore the Inventory DB, if there is a problem with it stop there.
	try:
		p = subprocess.Popen(['ssh',inventoryDB,'/opt/infra/dbInfraBackupRestore.sh','restore'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		rc = rc + p.returncode
		p = subprocess.Popen(['ssh',inventoryDB,'rm -f','/tmp/infra_database_backup.tar.gz'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
		output, err = p.communicate()
		
	except Exception as e:
		rootLogger.error("Unable to restore the Inventory DB: %s" % (e))
		sys.exit(1)
	if rc > 0:
		rootLogger.error("Unable to restore the Inventory DB: %s" % (err))
		sys.exit(1)
	else:
		rootLogger.info("Inventory DB Restored successfully.")
	# Now try to restore the monitoring DB
	# rootLogger.info("Now Restoring the Monitoring DB.")
	# try:
	# 	p = subprocess.Popen(['ssh',monitoringDB,'/opt/infra/dbMonitoringBackupRestore.sh','restore'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	rc = rc + p.returncode
	# 	p = subprocess.Popen(['ssh',monitoringDB,'rm -f','/tmp/monitoring_database_backup.tar.gz'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# 	output, err = p.communicate()
	# 	
	# except Exception,e:
	# 	rootLogger.error("Unable to restore the Monitoring DB: %s" % (e))
	# 	sys.exit(1)
	# if rc > 0:
	# 	rootLogger.error("Unable to restore the Monitoring DB: %s" % (err))
	# 	sys.exit(1)
	# else:
	# 	rootLogger.info("Monitoring DB Restored successfully.")
	# 
	# rootLogger.info("Starting the Primary Node %s" % primaryNode)
	# Start the Primary Node, it is a critical component, so it will stop in case of failure
	try:
		p = subprocess.Popen(['nohup','/opt/infra/startInfraAll.sh','&'])
		p.communicate()
				
	except Exception as e:
		rootLogger.error("Unable to start the Primary Node: %s, reason: %s" % (primaryNode,e))
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
	# 			break;
	# 		rootLogger.info("Service Node %s successfully started." % node)
	rootLogger.info("############         RESTORE SUCESSFULLY ENDED        #####################")
	sys.exit(0)
if __name__ == "__main__":
	main()
