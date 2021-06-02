/*
API Information:
 - Class: "bgpAsP"
 - Distinguished Name: "uni/fabric/bgpInstP-default"
GUI Location:
 - System > System Settings > BGP Route Reflector: 65002
*/
resource "aci_rest" "BGP_ASN_65002" {
    path        = "/api/node/mo/uni/fabric/bgpInstP-default/as.json"
    class_name  = "bgpAsP"
    payload     = <<EOF
{
    "bgpAsP": {
        "attributes": {
            "dn": "uni/fabric/bgpInstP-default/as",
            "asn": "65002"
        },
        "children": []
    }
}
    EOF
}

