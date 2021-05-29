/*
API Information:
 - Class: "syslogGroup"
 - Distinguished Name: "uni/fabric/slgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > default
*/
resource "aci_rest" "Syslog_DestGrp_default" {
    path        = "/api/node/mo/uni/fabric/slgroup-default.json"
    class_name  = "syslogGroup"
    payload     = <<EOF
{
    "syslogGroup": {
        "attributes": {
            "dn": "uni/fabric/slgroup-default",
            "name": "default",
            "format": "aci",
            "includeMilliSeconds": "yes",
            "includeTimeZone": "yes",
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
resource "aci_rest" "Syslog_Source_default" {
    depends_on  = [
        aci_rest.Syslog_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/moncommon/slsrc-default.json"
    class_name  = "syslogSrc"
    payload     = <<EOF
{
    "syslogSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/slsrc-default",
            "name": "default",
            "incl": "faults,session",
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

/*
API Information:
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > default > Create Syslog Remote Destination
*/
resource "aci_rest" "Syslog_DestGrp_default_Server_10-101-128-24" {
    depends_on    = [
        aci_rest.Syslog_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/slgroup-default/rdst-10.101.128.24.json"
    class_name  = "syslogRemoteDest"
    payload     = <<EOF
{
    "syslogRemoteDest": {
        "attributes": {
            "dn": "uni/fabric/slgroup-default/rdst-10.101.128.24",
            "host": "10.101.128.24",
            "name": "10.101.128.24",
            "forwardingFacility": "local7",
            "port": "514",
            "severity": "information",
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
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
 - Class: "syslogRemoteDest"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Syslog > default > Create Syslog Remote Destination
*/
resource "aci_rest" "Syslog_DestGrp_default_Server_10-101-128-25" {
    depends_on    = [
        aci_rest.Syslog_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/slgroup-default/rdst-10.101.128.25.json"
    class_name  = "syslogRemoteDest"
    payload     = <<EOF
{
    "syslogRemoteDest": {
        "attributes": {
            "dn": "uni/fabric/slgroup-default/rdst-10.101.128.25",
            "host": "10.101.128.25",
            "name": "10.101.128.25",
            "forwardingFacility": "local7",
            "port": "514",
            "severity": "information",
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

