/*
Create SNMP Source and SNMP Trap Destination Group
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
*/
resource "aci_rest" "snmp_trap_Src" {
    depends_on  = [aci_rest.snmp_trap_dest_grp_default]
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

