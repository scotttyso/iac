/*
API Information:
 - Class: "infraPortTrackPol"
 - Distinguished Name: "uni/infra/trackEqptFabP-default"
GUI Location:
 - System > System Settings > Port Tracking
*/
resource "aci_rest" "Port_Tracking" {
    path       = "/api/node/mo/uni/infra/trackEqptFabP-default.json"
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

