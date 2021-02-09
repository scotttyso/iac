resource "aci_rest" "realm_default" {
	path		= "/api/node/mo/uni/userext/authrealm.json"
	class_name	= "aaaAuthRealm"
	payload		= <<EOF
{
    "aaaAuthRealm": {
        "attributes": {
            "dn": "uni/userext/authrealm"
        },
        "children": [
            {
                "aaaDefaultAuth": {
                    "attributes": {
                        "dn": "uni/userext/authrealm/defaultauth",
                        "realm": "local"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

