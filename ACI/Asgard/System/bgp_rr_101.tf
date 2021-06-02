/*
API Information:
 - Class: "bgpRRNodePEp"
 - Distinguished Name: "uni/fabric/bgpInstP-default/rr/node-101"
GUI Location:
 - System > System Settings > BGP Route Reflector: Route Reflector Nodes
*/
resource "aci_rest" "BGP_Route_Reflector_101" {
    path        = "/api/node/mo/uni/fabric/bgpInstP-default/rr/node-101.json"
    class_name  = "bgpRRNodePEp"
    payload     = <<EOF
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

