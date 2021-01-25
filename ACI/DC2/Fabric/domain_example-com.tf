/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[example.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "domain_example-com" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/dom-[example.com].json"
	class_name	= "dnsDomain"
	payload		= <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[example.com]",
            "name": "example.com",
            "isDefault": "no",
            "rn": "dom-[example.com]"
        },
        "children": []
    }
}
	EOF
}

