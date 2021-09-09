
/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-1/node-101"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "Inventory_Pod_1_Node_wakanda-spine101" {
    fabric_id   = "1"
    name        = "wakanda-spine101"
    # name_alias  = ""
    node_id     = "101"
    node_type   = "unspecified"
    pod_id      = "1"
    role        = "spine"
    serial      = "FDO22472FD7"
}

