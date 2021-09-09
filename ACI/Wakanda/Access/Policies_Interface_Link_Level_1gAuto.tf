#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-1gAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 1gAuto
*/
resource "aci_fabric_if_pol" "Link_Level_1gAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "1gAuto"
    name_alias      =  "None"
    speed           =  "1G"
}

