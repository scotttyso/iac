#------------------------------------------
# Create Spanning-Tree Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "stpIfPol"
 - Distinguished Name: "uni/infra/ifPol-bpduFG"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Spanning Tree Interface : bpduFG
*/
resource "aci_spanning_tree_interface_policy" "STP_bpduFG" {
    description = "BPDU Filter and Guard"
    name        = "example"
    ctrl        = ["bpdu-filter","bpdu-guard"]
}

# resource "aci_rest" "STP_bpduFG" {
#     path        = "/api/node/mo/uni/infra/ifPol-bpduFG.json"
#     class_name  = "stpIfPol"
#     payload     = <<EOF
# {
#     "stpIfPol": {
#         "attributes": {
#
#             "descr": "BPDU Filter and Guard",
#             "dn": "uni/infra/ifPol-bpduFG",
#             "descr": "BPDU Filter and Guard",
#             "name": "bpduFG",
#             "nameAlias": "None"
#         }
#     }
# }
#   EOF
# }

