/*
API Information:
 - Class: "snmpClientP"
 - Distinguished Name: "uni/fabric/snmppol-default/clgrp-/client-[198.18.1.61]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Client Group Policies: inband > Client Entries
*/
resource "aci_rest" "snmp_policy_default_clientgroup_inband_198-18-1-61" {
    depends_on  = [aci_rest.snmp_policy_default,aci_rest.snmp_policy_default_clientgroup_inband]
    path        = "/api/node/mo/uni/fabric/snmppol-default/clgrp-inband/client-[198.18.1.61].json"
    class_name  = "snmpClientP"
    payload     = <<EOF
{
    "snmpClientP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/clgrp-inband/client-[198.18.1.61]",
            "name": "snmp-server1",
            "addr": "198.18.1.61",
        },
        "children": []
    }
}
    EOF
}

