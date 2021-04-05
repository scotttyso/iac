#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-16G_F_auto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : 16G_F_auto
*/
resource "aci_interface_fc_policy" "16G_F_auto" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "16G_F_auto"
    name_alias      = "None"
    port_mode       = "f"
    rx_bb_credit    = "64"
    speed           = "16G"
    trunk_mode      = "auto"
}

