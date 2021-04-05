/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-cisco_user2"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "snmp_policy_default_user_cisco_user2" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user2.json"
    class_name  = "snmpUserP"
    payload     = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user2",
            "name": "cisco_user2",
            "privType": "des",
            "privKey": "${var.Privacy_Key2}",
            "authKey": "${var.Authorization_Key2}"
        },
        "children": []
    }
}
    EOF
}

