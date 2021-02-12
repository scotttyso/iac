/*
API Information:
 - Class: "snmpPol"
 - Distinguished Name: "uni/fabric/snmppol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default: Contact/Location
*/
resource "aci_rest" "snmp_info" {
	path		= "/api/node/mo/uni/fabric/snmppol-default.json"
	class_name	= "snmpPol"
	payload		= <<EOF
{
    "snmpPol": {
        "attributes": {
            "dn": "uni/fabric/snmppol-default",
            "descr": "This is the default SNMP Policy",
            "adminSt": "enabled",
            "contact": "cust-lab@example.com",
            "loc": "DC1"
        },
        "children": []
    }
}
	EOF
}

