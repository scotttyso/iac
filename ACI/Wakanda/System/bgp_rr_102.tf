/*
API Information:
 - Class: "bgpRRNodePEp"
 - Distinguished Name: "uni/fabric/bgpInstP-default/rr/node-102"
GUI Location:
 - System > System Settings > BGP Route Reflector: Route Reflector Nodes
*/
resource "aci_rest" "BGP_Route_Reflector_102" {
    path        = "/api/node/mo/uni/fabric/bgpInstP-default/rr/node-102.json"
    class_name  = "bgpRRNodePEp"
    payload     = <<EOF
{
    "bgpRRNodePEp": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/rr/node-102",
            "id": "102",
            "rn": "node-102"
        },
        "children": []
    }
}
    EOF
}

