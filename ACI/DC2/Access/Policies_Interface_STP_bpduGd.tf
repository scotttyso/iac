#------------------------------------------
# Create Spanning-Tree Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "stpIfPol"
 - Distinguished Name: "uni/infra/ifPol-bpduGd"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Spanning Tree Interface : bpduGd
*/
# resource "aci_spanning_tree_interface_policy" "STP_bpduGd" {
#
#     description = "BPDU Guard"
#     name        = "example"
#     ctrl        = ["bpdu-guard"]
# }
#            # "ctrl": "",

resource "aci_rest" "STP_bpduGd" {
    path        = "/api/node/mo/uni/infra/ifPol-bpduGd.json"
    class_name  = "stpIfPol"
    payload     = <<EOF
{
    "stpIfPol": {
        "attributes": {
            "descr": "BPDU Guard",
            "dn": "uni/infra/ifPol-bpduGd",
            "descr": "BPDU Guard",
            "name": "bpduGd",
            "nameAlias": "None"
        }
    }
}
  EOF
}

