#------------------------------------------
# Create Spanning-Tree Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "stpIfPol"
 - Distinguished Name: "uni/infra/ifPol-bpduFt"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Spanning Tree Interface : bpduFt
*/
resource "aci_spanning_tree_interface_policy" "STP_bpduFt" {
    description = "BPDU Filter"
    name        = "example"
    ctrl        = ["bpdu-filter"]
}

# resource "aci_rest" "STP_bpduFt" {
#     path        = "/api/node/mo/uni/infra/ifPol-bpduFt.json"
#     class_name  = "stpIfPol"
#     payload     = <<EOF
# {
#     "stpIfPol": {
#         "attributes": {
#
#             "descr": "BPDU Filter",
#             "dn": "uni/infra/ifPol-bpduFt",
#             "descr": "BPDU Filter",
#             "name": "bpduFt",
#             "nameAlias": "None"
#         }
#     }
# }
#   EOF
# }

