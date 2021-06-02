/*
API Information:
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > default
*/
resource "aci_rest" "SNMP_Trap_DestGrp_default" {
    path        = "/api/node/mo/uni/fabric/snmpgroup-default.json"
    class_name  = "snmpGroup"
    payload     = <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-default",
            "descr": "default SNMP Trap Destination Group created by the Terraform Startup Script",
            "name": "default"
        }
    }
}
    EOF
}

/*
Create SNMP Source and SNMP Trap Destination Group
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
*/
resource "aci_rest" "SNMP_Trap_Source" {
    depends_on  = [
        aci_rest.SNMP_Trap_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/moncommon/snmpsrc-default.json"
    class_name  = "snmpSrc"
    payload     = <<EOF
{
    "snmpSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/snmpsrc-default",
            "incl": "audit,events,faults,session",
            "name": "default",
        },
        "children": [
            {
                "snmpRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/snmpgroup-default",
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
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > default
*/
resource "aci_rest" "SNMP_Trap_DestGrp_default_Receiver_10-101-128-24" {
    depends_on  = [
        aci_rest.SNMP_Trap_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/snmpgroup-default/trapdest-10.101.128.24-port-162.json"
    class_name  = "snmpTrapDest"
    payload     = <<EOF
{
    "snmpTrapDest": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-default/trapdest-10.101.128.24-port-162",
            "host": "10.101.128.24",
            "port": "162",
            "secName": "sensitive_var1",
            "v3SecLvl": "noauth",
            "ver": "v2c",
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "snmpGroup"
 - Distinguished Name: "uni/fabric/snmpgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > default
*/
resource "aci_rest" "SNMP_Trap_DestGrp_default_Receiver_10-101-128-25" {
    depends_on  = [
        aci_rest.SNMP_Trap_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/snmpgroup-default/trapdest-10.101.128.25-port-162.json"
    class_name  = "snmpTrapDest"
    payload     = <<EOF
{
    "snmpTrapDest": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-default/trapdest-10.101.128.25-port-162",
            "host": "10.101.128.25",
            "port": "162",
            "secName": "sensitive_var1",
            "v3SecLvl": "noauth",
            "ver": "v2c",
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

