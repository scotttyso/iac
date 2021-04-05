/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[198.18.1.51]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "dns_profile_default_198-18-1-51" {
    depends_on  = [aci_rest.dns_profile_default]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[198.18.1.51].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "198.18.1.51",
            "dn": "uni/fabric/dnsp-default/prov-[198.18.1.51]",
            "preferred": "no",
        },
        "children": []
    }
}
    EOF
}

