/*
API Information:
 - Class: "snmpUserP"
 - Distinguished Name: "uni/fabric/snmppol-default/user-cisco_user1"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: SNMP V3 Users
*/
resource "aci_rest" "snmp_policy_default_user_cisco_user1" {
    depends_on  = [aci_rest.snmp_policy_default]
    path        = "/api/node/mo/uni/fabric/snmppol-default/user-cisco_user1.json"
    class_name  = "snmpUserP"
    payload     = <<EOF
{
    "snmpUserP": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default/user-cisco_user1",
            "name": "cisco_user1",
            "privType": "aes-128",
            "privKey": "${var.Privacy_Key1}",
            "authType": "hmac-sha1-96",
            "authKey": "${var.Authorization_Key1}"
        },
        "children": []
    }
}
    EOF
}

