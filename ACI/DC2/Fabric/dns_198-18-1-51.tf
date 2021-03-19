/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[198.18.1.51]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "dns_198-18-1-51" {
	path		= "/api/node/mo/uni/fabric/dnsp-default/prov-[198.18.1.51].json"
	class_name	= "dnsProv"
	payload		= <<EOF
{
    "dnsProv": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/prov-[198.18.1.51]",
            "addr": "198.18.1.51",
            "preferred": "no",
            "rn": "prov-[198.18.1.51]"
        },
        "children": []
    }
}
	EOF
}

