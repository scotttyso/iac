#------------------------------------------
# Create Breakout Port Policy Groups
#------------------------------------------

/*
API Information:
 - Class: "infraBrkoutPortGrp"
 - Distinguished Name: "uni/infra/funcprof/brkoutportgrp-10g-4x"
GUI Location:
 - Fabric > Access Policies > Interface > Leaf Interfaces > Policy Groups > Leaf Breakout Port Group:10g-4x
*/
resource "aci_leaf_breakout_port_group" "10g-4x" {
    brkout_map  = "10g-4x"
    # description = "Breakup Map for 4 x 10G"
    name        = "10g-4x"
}

