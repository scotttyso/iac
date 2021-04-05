/*
API Information:
 - Class: "snmpPol"
 - Distinguished Name: "uni/fabric/snmppol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default
*/
resource "aci_rest" "snmp_policy_default" {
    path        = "/api/node/mo/uni/fabric/snmppol-default.json"
    class_name  = "snmpPol"
    payload     = <<EOF
{
    "snmpPol": {
        "attributes": {
            "adminSt": "enabled",
            "contact": "cust-lab@example.com",
            "descr": "This is the default SNMP Policy",
            "dn": "uni/fabric/snmppol-default",
            "loc": "DC2",
            "name": "default"
        },
        "children": []
    }
}
    EOF
}

