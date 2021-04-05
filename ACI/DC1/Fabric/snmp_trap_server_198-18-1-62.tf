/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "snmp_policy_default_snmp_trap_198-18-1-62" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62].json"
    class_name  = "snmpTrapFwdServerP"
    payload     = <<EOF
{
    "snmpTrapFwdServerP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62]",
            "addr": "198.18.1.62",
            "port": "162"
        },
        "children": []
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
resource "aci_rest" "snmp_trap_dest_198-18-1-62" {
    depends_on  = [aci_rest.snmp_policy_default_snmp_trap_198-18-1-62,aci_rest.snmp_trap_dest_grp_default]
    path        = "/api/node/mo/uni/fabric/snmpgroup-default/trapdest-198.18.1.62-port-162.json"
    class_name  = "snmpTrapDest"
    payload     = <<EOF
{
    "snmpTrapDest": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-default/trapdest-198.18.1.62-port-162",
            "host": "198.18.1.62",
            "port": "162",
            "secName": "sensitive_var2",
            "v3SecLvl": "priv",
            "ver": "v3",
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.Inband}"
                    }
                }
            }
        ]
    }
}
    EOF
}

