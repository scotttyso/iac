#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-100g-2x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:100g-2x
*/
resource "aci_leaf_breakout_port_group" "100g-2x" {
    brkout_map  = "100g-2x"
    # description = "Breakup Map for 2 x 100G"
    name        = "100g-2x"
}

