#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-50gAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 50gAuto
*/
resource "aci_fabric_if_pol" "50gAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "50gAuto"
    name_alias      =  "None"
    speed           =  "50G"
}

