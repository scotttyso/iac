#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-50g-8x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:50g-8x
*/
resource "aci_leaf_breakout_port_group" "Policy_Group_Breakout_50g-8x" {
    brkout_map  = "50g-8x"
    description = "Breakup Map for 8 x 50G"
    name        = "50g-8x"
}

