/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[2001::1]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "dns_profile_default_2001--1" {
    depends_on  = [aci_rest.dns_profile_default]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[2001::1].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "2001::1",
            "dn": "uni/fabric/dnsp-default/prov-[2001::1]",
            "preferred": "yes",
        },
        "children": []
    }
}
    EOF
}

