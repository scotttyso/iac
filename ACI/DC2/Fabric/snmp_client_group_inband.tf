/*
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-inband"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: inband
*/
resource "aci_rest" "snmp_policy_default_clientgroup_inband" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-inband.json"
    class_name  = "snmpClientGrpP"
    payload     = <<EOF
{
    "snmpClientGrpP": {
        "attributes": {
            "descr": "Inband Client Group",
            "dn": "uni/fabric/snmppol-default/clgrp-${each.value.name}_Clients",
            "name": "inband",
        },
        "children": [
            {
                "snmpRsEpg": {
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

