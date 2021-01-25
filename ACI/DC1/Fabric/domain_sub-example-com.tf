/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[sub.example.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "domain_sub-example-com" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/dom-[sub.example.com].json"
	class_name	= "dnsDomain"
	payload		= <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[sub.example.com]",
            "name": "sub.example.com",
            "isDefault": "yes",
            "rn": "dom-[sub.example.com]"
        },
        "children": []
    }
}
	EOF
}

