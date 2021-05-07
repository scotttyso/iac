/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
API Information:
 - Class: "isisDomPol"
 - Distinguished Name: "uni/fabric/isisDomP-default"
GUI Location:
 - System > System Settings > ISIS Policy
*/
resource "aci_rest" "ISIS_Policy" {
    path       = "/api/node/mo/uni/fabric/isisDomP-default.json"
    class_name = "isisDomPol"
    payload    = <<EOF
{
    "isisDomPol": {
        "attributes": {
            "dn": "uni/fabric/isisDomP-default",
            "mtu": "1492",
            "redistribMetric": "63"
        },
        "children": [
            {
                "isisLvlComp": {
                    "attributes": {
                        "lspFastFlood": "enabled",
                        "lspGenInitIntvl": "50",
                        "lspGenMaxIntvl": "8000",
                        "lspGenSecIntvl": "50",
                        "spfCompInitIntvl": "50",
                        "spfCompMaxIntvl": "8000",
                        "spfCompSecIntvl": "50",
                        "type": "l1"
                    }
                }
            }
        ]
    }
}
    EOF
}

