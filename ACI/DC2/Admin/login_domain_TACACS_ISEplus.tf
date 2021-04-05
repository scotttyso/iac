/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Login_Domain_TACACS_ISEplus" {
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
                        "dn": "uni/userext/logindomain-ISEplus",
                        "name": "ISEplus"
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "descr": "TACACS Login Domain".
                                    "dn": "uni/userext/logindomain-ISEplus/domainauth",
                                    "providerGroup": "ISEplus",
                                    "realm": "tacacs"
                                }
                            }
                        }
                    ]
                }
            },
            {
                "aaaTacacsPlusEp": {
                    "attributes": {
                        "dn": "uni/userext/tacacsext"
                    }
                }
            }
        ]
    }
}
    EOF
}

