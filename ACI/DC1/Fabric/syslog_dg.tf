/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > default
*/
resource "aci_rest" "syslog_dg_default" {
    path        = "/api/node/mo/uni/fabric/slgroup-default.json"
    class_name    = "syslogGroup"
    payload        = <<EOF
{
    "syslogGroup": {
        "attributes": {
            "dn": "uni/fabric/slgroup-default",
            "name": "default",
            "format": "aci",
            "includeMilliSeconds": "true",
            "includeTimeZone": "true",
            "descr": "Default Syslog Destination Group.  Created by Terraform Startup Script",
            "rn": "slgroup-default"
        },
        "children": [
            {
                "syslogConsole": {
                    "attributes": {
                        "dn": "uni/fabric/slgroup-default/console",
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
                        "dn": "uni/fabric/slgroup-default/file",
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
                        "dn": "uni/fabric/slgroup-default/prof",
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
 - Distinguished Name: "uni/fabric/moncommon/slsrc-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Syslog Source
*/
resource "aci_rest" "syslog_Src_default" {
    path        = "/api/node/mo/uni/fabric/moncommon/slsrc-default.json"
    class_name    = "syslogSrc"
    payload        = <<EOF
{
    "syslogSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/slsrc-default",
            "name": "default",
            "incl": "faults",
            "minSev": "information",
            "rn": "slsrc-default",
        },
        "children": [
            {
                "syslogRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/slgroup-default",
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

