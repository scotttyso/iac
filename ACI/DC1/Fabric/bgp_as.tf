/*
API Information:
 - Class: "bgpAsP"
 - Distinguished Name: "uni/fabric/bgpInstP-default"
GUI Location:
 - System > System Settings > BGP Route Reflector: Autonomous System Number
*/
resource "aci_rest" "bgp_as_65501" {
	path		= "/api/node/mo/uni/fabric/bgpInstP-default/as.json"
	class_name	= "bgpAsP"
	payload		= <<EOF
{
    "bgpAsP": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/as",
            "asn": "65501",
            "rn": "as"
        },
        "children": []
    }
}
	EOF
}

