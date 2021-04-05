/*
API Information:
 - Class: "l3IfPol"
 - Distinguished Named "uni/fabric/l3IfP-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > L3 Interface > default
*/
resource "aci_rest" "L3_Intf_Policy" {
    path       = "/api/node/mo/uni/fabric/l3IfP-default.json"
    class_name = "l3IfPol"
    payload    = <<EOF
{
    "l3IfPol": {
        "attributes": {
            "bfdIsis": "enabled",
            "descr": "Fabric/Underlay BFD Policy to enable BFD on Fabric Uplinks",
            "dn": "uni/fabric/l3IfP-default",
            "name": "default",
            "nameAlias": ""
        }
    }
}
    EOF
}

