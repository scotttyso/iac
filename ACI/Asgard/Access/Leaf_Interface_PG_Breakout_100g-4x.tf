#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-100g-4x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:100g-4x
*/
resource "aci_leaf_breakout_port_group" "Policy_Group_Breakout_100g-4x" {
    brkout_map  = "100g-4x"
    description = "Breakup Map for 4 x 100G"
    name        = "100g-4x"
}

