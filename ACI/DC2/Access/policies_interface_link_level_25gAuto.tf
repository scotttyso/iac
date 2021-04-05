#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-25gAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 25gAuto
*/
resource "aci_fabric_if_pol" "25gAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "25gAuto"
    name_alias      =  "None"
    speed           =  "25G"
}

