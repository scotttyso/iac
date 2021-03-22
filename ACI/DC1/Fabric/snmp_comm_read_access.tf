/*
API Information:
 - Class: "snmpCommunityP"
 - Distinguished Name: "uni/fabric/snmppol-default/community-read_access"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default > Community Policies
*/
resource "aci_rest" "snmp_comm_read_access" {
    path        = "/api/node/mo/uni/fabric/snmppol-default/community-read_access.json"
    class_name    = "snmpCommunityP"
    payload        = <<EOF
{
    "snmpCommunityP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/community-read_access",
            "descr": "Community String 1",
            "name": "read_access",
            "rn": "community-read_access"
        },
        "children": []
    }
}
    EOF
}

