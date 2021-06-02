#------------------------------------------
# Create Fibre-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "fcIfPol"
 - Distinguished Name: "uni/infra/fcIfPol-auto_F_trunk"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Fibre Channel Interface : auto_F_trunk
*/
resource "aci_interface_fc_policy" "FC_Interface_auto_F_trunk" {
    automaxspeed    = "32G"
    fill_pattern    = "ARBFF"
    name            = "auto_F_trunk"
    name_alias      = "None"
    port_mode       = "f"
    rx_bb_credit    = "64"
    speed           = "auto"
    trunk_mode      = "trunk-on"
}

