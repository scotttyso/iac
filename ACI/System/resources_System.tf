/*
 This File will include Policies Related to System Policies
*/

/*
System > System Settings > BGP Route Reflector: Autonomous System Number
*/
resource "aci_rest" "bgp_as_65513" {
	path		= "/api/node/mo/uni/fabric/bgpInstP-default/as.json"
	class_name	= "bgpAsP"
	payload		= <<EOF
{
    "bgpAsP": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/as",
            "asn": "65513",
            "rn": "as"
        },
        "children": []
    }
}
	EOF
}

/*
System > System Settings > BGP Route Reflector: Route Reflector Nodes
*/
resource "aci_rest" "bgp_rr_101" {
	path		= "/api/node/mo/uni/fabric/bgpInstP-default/rr/node-101.json"
	class_name	= "bgpRRNodePEp"
	payload		= <<EOF
{
    "bgpRRNodePEp": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/rr/node-101",
            "id": "101",
            "rn": "node-101"
        },
        "children": []
    }
}
	EOF
}

