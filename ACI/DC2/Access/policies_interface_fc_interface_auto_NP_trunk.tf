#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-auto_NP_trunk"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : auto_NP_trunk
*/
resource "aci_interface_fc_policy" "fc_auto_NP_trunk" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "auto_NP_trunk"
    name_alias      = "None"
    port_mode       = "np"
    rx_bb_credit    = "64"
    speed           = "auto"
    trunk_mode      = "trunk-on"
}

