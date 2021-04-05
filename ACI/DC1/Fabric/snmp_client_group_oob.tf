/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-oob"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: oob
*/
resource "aci_rest" "snmp_policy_default_clientgroup_oob" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-oob.json"
    class_name  = "snmpClientGrpP"
    payload     = <<EOF
{
    "snmpClientGrpP": {
        "attributes": {
            "descr": "Out-of-Band Client Group",
            "dn": "uni/fabric/snmppol-default/clgrp-${each.value.name}_Clients",
            "name": "oob",
        },
        "children": [
            {
                "snmpRsEpg": {
                    "attributes": {
                        "tDn": "${var.Out-of-Band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

