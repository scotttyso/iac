
/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-1/node-202"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "Inventory_Pod_1_Node_dc2-leaf202" {
    fabric_id   = "1"
    name        = "dc2-leaf202"
    # name_alias  = ""
    node_id     = "202"
    node_type   = "unspecified"
    pod_id      = "1"
    role        = "leaf"
    serial      = "TEP-1-102"
}

