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
resource "aci_rest" "fabric_wide_settings" {
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

/*
API Information:
 - Class: "infraPortTrackPol"
 - Distinguished Name: "uni/infra/trackEqptFabP-default"
GUI Location:
 - System > System Settings > Port Tracking
*/
resource "aci_rest" "Port_Tracking" {
    path       = "/api/node/mo/uni/uni/infra/trackEqptFabP-default.json"
    class_name = "infraPortTrackPol"
    payload    = <<EOF
{
    "infraPortTrackPol": {
        "attributes": {
            "adminSt": "on",
            "delay": "120",
            "dn": "uni/infra/trackEqptFabP-default",
            "includeApicPorts": "no",
            "minlinks": "0"
        },
        "children": []
    }
}
    EOF
}

