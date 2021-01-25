/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > [Syslog Dest Group]
*/
resource "aci_rest" "syslog_dg_" {
	path		= "/api/node/mo/uni/fabric/slgroup-.json"
	class_name	= "syslogGroup"
	payload		= <<EOF
{
	"syslogGroup": {
		"attributes": {
			"dn": "uni/fabric/slgroup-",
			"name": "",
            "format": "aci",
			"includeMilliSeconds": "true",
			"includeTimeZone": "true",
			"descr": "Default Syslog Destination Group.  Created by Terraform Startup Script",
			"rn": "slgroup-"
		},
		"children": [
			{
				"syslogConsole": {
					"attributes": {
						"dn": "uni/fabric/slgroup-/console",
                        "adminState": "enabled",
                        "severity": "critical",
                        "rn": "console"
					},
					"children": []
				}
			},
			{
				"syslogFile": {
					"attributes": {
						"dn": "uni/fabric/slgroup-/file",
                        "adminState": "enabled",
                        "severity": "information",
                        "rn": "file"
					},
					"children": []
				}
			},
			{
				"syslogProf": {
					"attributes": {
						"dn": "uni/fabric/slgroup-/prof",
						"rn": "prof"
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
 - Class: "syslogSrc"
 - Distinguished Name: "uni/fabric/moncommon/slsrc-"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source
*/
resource "aci_rest" "syslog_Src_" {
	path		= "/api/node/mo/uni/fabric/moncommon/slsrc-.json"
	class_name	= "syslogSrc"
	payload		= <<EOF
{
	"syslogSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/slsrc-",
			"name": "",
			"incl": "faults",
            "minSev": "information",
			"rn": "slsrc-",
		},
		"children": [
			{
				"syslogRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/slgroup-",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

