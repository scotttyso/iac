/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[198.18.1.62]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: oob > Client Entries
*/
resource "aci_rest" "snmp_policy_default_clientgroup_oob_198-18-1-62" {
    depends_on  = [aci_rest.snmp_policy_default,aci_rest.snmp_policy_default_clientgroup_oob]
    path        = "/api/node/mo/uni/fabric/snmppol-defaultt/clgrp-oob/client-[198.18.1.62].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-defaultt/clgrp-oob/client-[198.18.1.62]",
            "name": "snmp-server2",
            "addr": "198.18.1.62",
        },
        "children": []
    }
}
    EOF
}

