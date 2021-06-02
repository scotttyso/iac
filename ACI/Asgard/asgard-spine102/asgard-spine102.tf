
/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-1/node-102"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "Inventory_Pod_1_Node_asgard-spine102" {
    fabric_id   = "1"
    name        = "asgard-spine102"
    # name_alias  = ""
    node_id     = "102"
    node_type   = "unspecified"
    pod_id      = "1"
    role        = "spine"
    serial      = "FDO22220V7Y"
}

