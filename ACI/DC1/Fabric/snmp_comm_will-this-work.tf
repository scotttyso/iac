/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-will-this-work"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_comm_will-this-work" {
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-will-this-work.json"
    class_name    = "snmpCommunityP"
    payload        = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-will-this-work",
            "descr": "Community String 2",
            "name": "will-this-work",
            "rn": "community-will-this-work"
        },
        "children": []
    }
}
    EOF
}

