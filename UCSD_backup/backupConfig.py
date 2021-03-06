#
# Name: backupConfig.py
# Author: Alejandro Madurga (almadurg@cisco.com)
# Date: 10th November 2015
# Versions:
#	0.1 Initial Version
#
# UCSD Version: 5.3.1.2
# 
# Description:
# 	This file includes the multi node variables to be able to addres al the nodes
#	on the UCSD environment.
#	The required parameters are:
#	PrimaryNode: The IP of the primary Node
#	InventoryDB: The IP of the inventory DB
#	MonitoringDB: The IP of the monitoring DB
#	ServiceNodes: The IPs of the services nodes on a list mode.
#
#	The content of the file should be as follows:
#	PrimaryNode = "192.168.2.200"
#	InventoryDB = "192.168.2.201"
#	MonitoringDB = "192.168.2.202"
#	ServiceNodes = ["192.168.2.203","192.168.2.204"]
#	
#

#

PrimaryNode = "192.168.2.200"
InventoryDB = "192.168.2.201"
# MonitoringDB = "192.168.2.202"
# ServiceNodes = ["192.168.2.204","192.168.2.205"]
BackupPath = "/tmp/backup"


def main():
	print "This is a configuration file, it can't be invoked as a script file."
	print "This file is used by doBackup.py script, please execute doBackup.py."
if __name__ == "__main__":
	main()
    
    14+