/*
API Information:
 - Class: "snmpTrapFwdServerP"
 - Distinguished Name: "uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Trap Forward Servers
*/
resource "aci_rest" "snmp_trap_198-18-1-62" {
	path		= "/api/node/mo/uni/fabric/snmppol-default/trapfwdserver-[198.18.1.62].json"
	class_name	= "snmpTrapFwdServerP"
	payload		= <<EOF
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
 - Distinguished Name: "uni/fabric/snmpgroup-SNMP-TRAP_dg"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > SNMP > SNMP-TRAP_dg
*/
resource "aci_rest" "snmp_trap_dest_198-18-1-62" {
	path		= "/api/node/mo/uni/fabric/snmpgroup-SNMP-TRAP_dg.json"
	class_name	= "snmpGroup"
	payload		= <<EOF
{
    "snmpGroup": {
        "attributes": {
            "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg",
            "descr": "SNMP Trap Destination Group - Created by Terraform Startup Script",
            "name": "SNMP-TRAP_dg",
            "rn": "snmpgroup-SNMP-TRAP_dg"
        },
        "children": [
            {
                "snmpTrapDest": {
                    "attributes": {
                        "dn": "uni/fabric/snmpgroup-SNMP-TRAP_dg/trapdest-198.18.1.62-port-162",
                        "ver": "v3",
                        "host": "198.18.1.62",
                        "port": "162",
                        "secName": "cisco_user1",
                        "v3SecLvl": "priv",
                        "rn": "trapdest-198.18.1.62-port-162"
                    },
                    "children": [
                        {
                            "fileRsARemoteHostToEpg": {
                                "attributes": {
                                    "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                                }
                            }
                        }
                    ]
                }
            }
        ]
    }
}
	EOF
}

