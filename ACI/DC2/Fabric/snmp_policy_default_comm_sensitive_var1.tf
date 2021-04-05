/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-${var.SNMP_Community1}"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_policy_default_comm_${var.SNMP_Community1}" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-${var.SNMP_Community1}.json"
    class_name  = "snmpCommunityP"
    payload     = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "descr": "Community String 1",
            "dn": "uni/fabric/snmppol-default/community-${var.SNMP_Community1}",
            "name": "${var.SNMP_Community1}",
        },
        "children": []
    }
}
    EOF
}

