
/*
API Information:
 - Class: "fabricNode"
 - Distinguished Name: "topology/pod-1/node-201"
GUI Location:
 - Fabric > Access Policies > Inventory > Fabric Membership:[Registered Nodes or Nodes Pending Registration]
*/
resource "aci_fabric_node_member" "Inventory_Pod_1_Node_asgard-leaf201" {
    fabric_id   = "1"
    name        = "asgard-leaf201"
    # name_alias  = ""
    node_id     = "201"
    node_type   = "unspecified"
    pod_id      = "1"
    role        = "leaf"
    serial      = "FDO232415ML"
}

