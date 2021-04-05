#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-auto_NP_auto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : auto_NP_auto
*/
resource "aci_interface_fc_policy" "auto_NP_auto" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "auto_NP_auto"
    name_alias      = "None"
    port_mode       = "np"
    rx_bb_credit    = "64"
    speed           = "auto"
    trunk_mode      = "auto"
}

