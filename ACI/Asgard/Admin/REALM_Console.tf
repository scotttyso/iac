resource "aci_rest" "REALM_console" {
    path        = "/api/node/mo/uni/userext/authrealm.json"
    class_name  = "aaaAuthRealm"
    payload     = <<EOF
{
    "aaaAuthRealm": {
        "attributes": {
            "dn": "uni/userext/authrealm"
        },
        "children": [
            {
                "aaaConsoleAuth": {
                    "attributes": {
                        "dn": "uni/userext/authrealm/consoleauth",
                        "realm": "local",
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

