/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
Assign Best Practice Values for the Following Settings
API Information:
 - Class: "infraSetPol"
 - Distinguished Name: "uni/infra/settings"
GUI Location:
 - System > System Settings > Fabric Wide Settings
*/
resource "aci_rest" "Fabric_Wide_Settings" {
    path       = "/api/node/mo/uni/infra/settings.json"
    class_name = "infraSetPol"
    payload    = <<EOF
{
    "infraSetPol": {
        "attributes": {
            "disableEpDampening": "no",
            "dn": "uni/infra/settings",
            "domainValidation": "yes",
            "enableMoStreaming": "no",
            "enableRemoteLeafDirect": "yes",
            "enforceSubnetCheck": "yes",
            "opflexpAuthenticateClients": "yes",
            "opflexpUseSsl": "yes",
            "reallocateGipo": "no",
            "restrictInfraVLANTraffic": "no",
            "unicastXrEpLearnDisable": "yes",
            "validateOverlappingVlans": "no"
        }
    }
}
    EOF
}

