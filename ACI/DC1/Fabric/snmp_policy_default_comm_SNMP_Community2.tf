/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-SNMP_Community2"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_policy_default_comm_SNMP_Community2" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-${var.SNMP_Community2}.json"
    class_name  = "snmpCommunityP"
    payload     = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "descr": "Community String 2",
            "dn": "uni/fabric/snmppol-default/community-${var.SNMP_Community2}",
            "name": "${var.SNMP_Community2}",
        },
        "children": []
    }
}
    EOF
}

