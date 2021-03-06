/*
API Information:
 - Class: "qosInstPol"
 - Distinguished Name: "uni/infra/qosinst-default"
GUI Location:
 - Fabric > Access Policies > Policies > Global > QOS Class

*/
resource "aci_rest" "Preserve_CoS" {
    path       = "/api/node/mo/uni/infra/qosinst-default.json"
    class_name = "qosInstPol"
    payload    = <<EOF
{
    "qosInstPol": {
        "attributes": {
            "dn": "uni/infra/qosinst-default",
            "ctrl": "dot1p-preserve"
        }
    }
}
    EOF
}

