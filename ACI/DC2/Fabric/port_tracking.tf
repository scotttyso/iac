/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
Assign Best Practice Values for the Following Settings
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
            "dn": "uni/infra/trackEqptFabP-default",
        },
        "children": []
    }
}
    EOF
}

