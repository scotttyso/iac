#!/usr/bin/python
#
# Name: listBackups.py
# Author: Alejandro Madurga (almadurg@cisco.com)
# Date: 18th November 2015
# Versions:
#	0.1 Initial Version 
#	
#
# UCSD Version: 5.3.1.2
# 
# Description:
# 	This script executes list the existing backup files on the Inventory and Monitoring Nodes
# INPUTS:
# 	None needed, it will get the backup directory from the backupConfig.py file
#	Use -h --help to get help on this script
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
	parser = optparse.OptionParser(description="""This script will show the list of available database backup files.""" + \
	"""It reads the configuration info from the backupConfig.py file. If the file does not exit it will fail.""",
	version = "listBackups 1.0",usage = "%prog")
	args=parser.parse_args()
	#Now check the existence of the configuration variables
	try:
		inventoryDB = backupConfig.InventoryDB
		# monitoringDB = backupConfig.MonitoringDB
		backupPath = backupConfig.BackupPath
	except AttributeError:
		rootLogger.error("Parameter missing on backupConfig.py file, please review the parameters on that file.")
		screenLogger.error("Parameter missing on backupConfig.py file, please review the parameters on that file.")
		sys.exit(1)
	#Ok, lets check the existence of those files on the servers!
	p = subprocess.Popen(['ssh',inventoryDB,'ls','-lrt',backupPath], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	stdout, stderr = p.communicate()
	rc = p.returncode
	if rc != 0:
		print "Unable to read the backup file list from the Inventory DB Node"
		sys.exit(1)
	else:
		print "########### INVENTORY BACKUP FILES ON INVENTORY DB NODE: %s ############" % inventoryDB
		print stdout
    #Ok, lets check the existence of those files on the monitoringDB Server!
	# p = subprocess.Popen(['ssh',monitoringDB,'ls','-lrt',backupPath], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
	# stdout, stderr = p.communicate()
	# rc = p.returncode
	# 
	# if rc != 0:
	# 	print "Unable to read the backup file list from the Monitoring DB Node"
	# 	sys.exit(1)
	# else:
	# 	print "########### MONITORING BACKUP FILES ON MONITORING DB NODE: %s ############" % monitoringDB
	# 	print stdout

	
	
	
	sys.exit(0)
if __name__ == "__main__":
	main()
