/*
API Information:
 - Class: "coopPol"
 - Distinguished Named "uni/fabric/pol-default"
GUI Location:
 - System > System Settings > Coop Group > Type
*/
resource "aci_rest" "Coop_Group" {
    path       = "/api/node/mo/uni/fabric/pol-default.json"
    class_name = "coopPol"
    payload    = <<EOF
{
    "coopPol": {
        "attributes": {
            "dn": "uni/fabric/pol-default",
            "type": "strict"
        }
    }
}
    EOF
}

