/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[example.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "dns_profile_default_domain_example-com" {
    depends_on  = [aci_rest.dns_profile_default]
    path        = "/api/node/mo/uni/fabric/dnsp-default/dom-[example.com].json"
    class_name  = "dnsDomain"
    payload     = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[example.com]",
            "isDefault": "no",
            "name": "example.com"
        },
        "children": []
    }
}
    EOF
}

