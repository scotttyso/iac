/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Login_Domain_RADIUS_ISE" {
    path        = "/api/node/mo/uni/userext.json"
    class_name    = "aaaUserEp"
    payload        = <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-ISE",
                        "name": "ISE",
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "descr": "RADIUS Login Domain".
                                    "dn": "uni/userext/logindomain-ISE/domainauth",
                                    "providerGroup": "ISE",
                                    "realm": "radius",
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaRadiusEp": {
                    "attributes": {
                        "dn": "uni/userext/radiusext"
                    },
                }
            }
        ]
    }
}
    EOF
}

