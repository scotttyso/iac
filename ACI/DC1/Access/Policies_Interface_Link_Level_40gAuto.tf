#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-40gAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 40gAuto
*/
resource "aci_fabric_if_pol" "Link_Level_40gAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "40gAuto"
    name_alias      =  "None"
    speed           =  "40G"
}

