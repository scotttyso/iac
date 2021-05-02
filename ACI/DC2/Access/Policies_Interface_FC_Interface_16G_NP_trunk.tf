#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-16G_NP_trunk"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : 16G_NP_trunk
*/
resource "aci_interface_fc_policy" "FC_Interface_16G_NP_trunk" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "16G_NP_trunk"
    name_alias      = "None"
    port_mode       = "np"
    rx_bb_credit    = "64"
    speed           = "16G"
    trunk_mode      = "trunk-on"
}

