#------------------------------------------
# Create Spanning-Tree Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "stpIfPol"
 - Distinguished Name: "uni/infra/ifPol-default"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Spanning Tree Interface : default
*/
# resource "aci_spanning_tree_interface_policy" "STP_default" {
#
#     description = "Both Disabled"
#     name        = "example"
#     ctrl        = ["unspecified"]
# }
#            # "ctrl": "",

resource "aci_rest" "STP_default" {
    path        = "/api/node/mo/uni/infra/ifPol-default.json"
    class_name  = "stpIfPol"
    payload     = <<EOF
{
    "stpIfPol": {
        "attributes": {
            "descr": "Both Disabled",
            "dn": "uni/infra/ifPol-default",
            "descr": "Both Disabled",
            "name": "default",
            "nameAlias": "None"
        }
    }
}
  EOF
}

