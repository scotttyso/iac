/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
API Information:
 - Class: "epLoopProtectP"
 - Distinguished Name: "uni/infra/epLoopProtectP-default"
GUI Location:
 - System > System Settings > Endpoint Controls > Ep Loop Protection
*/
resource "aci_rest" "Endpoint_Loop_Protection" {
    path       = "/api/node/mo/uni/infra/epLoopProtectP-default.json"
    class_name = "epLoopProtectP"
    payload    = <<EOF
{
    "epLoopProtectP": {
        "attributes": {
            "action": "",
            "adminSt": "enabled",
            "dn": "uni/infra/epLoopProtectP-default",
            "loopDetectIntvl": "60",
            "loopDetectMult": "4"
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "epControlP"
 - Distinguished Name: "uni/infra/epCtrlP-default"
GUI Location:
 - System > System Settings > Rogue EP Control
*/
resource "aci_rest" "Rogue_EP_Control" {
    path       = "/api/node/mo/uni/infra/epCtrlP-default.json"
    class_name = "epControlP"
    payload    = <<EOF
{
    "epControlP": {
        "attributes": {
            "adminSt": "enabled",
            "dn": "uni/infra/epCtrlP-default",
            "holdIntvl": "1800",
            "rogueEpDetectIntvl": "30",
            "rogueEpDetectMult": "6",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "epIpAgingP"
 - Distinguished Name: "uni/infra/ipAgingP-default"
GUI Location:
 - System > System Settings > Endpoint Controls > Ip Aging
*/
resource "aci_rest" "Endpoint_IP_Aging" {
    path       = "/api/node/mo/uni/infra/ipAgingP-default.json"
    class_name = "epLoopProtectP"
    payload    = <<EOF
{
    "epIpAgingP": {
        "attributes": {
            "adminSt": "enabled",
            "dn": "uni/infra/ipAgingP-default",
        }
    }
}
    EOF
}

