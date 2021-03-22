/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
API Information:
 - Class: "edrErrDisRecoverPol"
 - Distinguished Named "uni/infra/edrErrDisRecoverPol-default"
GUI Location:
 - Fabric > Access Policies > Policies > Global > Error Disabled Recovery Policy
*/
resource "aci_rest" "Error_Disable_Recovery" {
    path       = "/api/node/mo/uni/infra/edrErrDisRecoverPol-default.json"
    class_name = "edrErrDisRecoverPol"
    payload    = <<EOF
{
    "edrErrDisRecoverPol": {
        "attributes": {
            "dn": "uni/infra/edrErrDisRecoverPol-default",
            "errDisRecovIntvl": "300"
        },
        "children": [
            {
                "edrEventP": {
                    "attributes": {
                        "event": "event-bpduguard",
                        "recover": "yes"
                    }
                }
            },
            {
                "edrEventP": {
                    "attributes": {
                        "event": "event-ep-move",
                        "recover": "yes"
                    }
                }
            },
            {
                "edrEventP": {
                    "attributes": {
                        "event": "event-mcp-loop",
                        "recover": "yes"
                    }
                }
            }
        ]
    }
}
    EOF
}

