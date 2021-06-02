/*
API Information:
 - Class: "fabricNodeControl"
 - Distinguished Named "uni/fabric/nodecontrol-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Fabric Node Controls > default
*/
resource "aci_rest" "Fabric_Node_Control" {
    path       = "/api/node/mo/uni/fabric/nodecontrol-default.json"
    class_name = "fabricNodeControl"
    payload    = <<EOF
{
    "fabricNodeControl": {
        "attributes": {
            "control": "1",
            "descr": "Configured by Startup Script",
            "dn": "uni/fabric/nodecontrol-default",
            "featureSel": "telemetry",
            "name": "default"
        }
    }
}
    EOF
}


