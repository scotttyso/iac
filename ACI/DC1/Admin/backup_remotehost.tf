/*
API Information:
 - Class: "trigSchedP"
 - Distinguished Name: "uni/fabric/schedp-Every24Hours"
GUI Location:
 - Admin > Schedulers > Fabric > Every24Hours
*/
resource "aci_rest" "backup_scheduler" {
	path		= "/api/node/mo/uni/fabric/schedp-Every24Hours.json"
	class_name	= "trigSchedP"
	payload		= <<EOF
{
    "trigSchedP": {
        "attributes": {
            "dn": "uni/fabric/schedp-Every24Hours",
            "name": "Every24Hours",
            "descr": "Create Backups Every 24 Hours - Terraform Startup Script.",
            "rn": "schedp-Every24Hours"
        },
        "children": [
            {
                "trigRecurrWindowP": {
                    "attributes": {
                        "dn": "uni/fabric/schedp-Every24Hours/recurrwinp-Every24Hours",
                        "name": "Every24Hours",
                        "hour": "0",
                        "minute": "15",
                        "concurCap": "20",
                        "rn": "recurrwinp-Every24Hours"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
API Information:
 - Class: "configExportP"
 - Distinguished Name: "uni/fabric/configexp-backup_every24Hours"
GUI Location:
 - Admin > Import/Export > Export Policies > Configuration > backup_every24Hours
*/
resource "aci_rest" "backup_Policy" {
	path		= "/api/node/mo/uni/fabric/configexp-backup_every24Hours.json"
	class_name	= "configExportP"
	payload		= <<EOF
{
    "configExportP": {
        "attributes": {
            "dn": "uni/fabric/configexp-backup_every24Hours",
            "adminSt": "triggered",
            "name": "backup_every24Hours",
            "descr": "Backup Configuration Every 24 Hours - Created by Terraform Startup Script",
            "rn": "configexp-backup_every24Hours"
        },
        "children": [
            {
                "configRsExportScheduler": {
                    "attributes": {
                        "tnTrigSchedPName": "Every24Hours"
                    },
                    "children": []
                }
            },
            {
                "configRsRemotePath": {
                    "attributes": {
                        "tnFileRemotePathName": "lnx2.example.com"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

