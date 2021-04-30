#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-100gAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 100gAuto
*/
resource "aci_fabric_if_pol" "link_level_100gAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "100gAuto"
    name_alias      =  "None"
    speed           =  "100G"
}

