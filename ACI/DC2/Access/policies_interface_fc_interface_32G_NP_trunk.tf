#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-32G_NP_trunk"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : 32G_NP_trunk
*/
resource "aci_interface_fc_policy" "32G_NP_trunk" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "32G_NP_trunk"
    name_alias      = "None"
    port_mode       = "np"
    rx_bb_credit    = "64"
    speed           = "32G"
    trunk_mode      = "trunk-on"
}

