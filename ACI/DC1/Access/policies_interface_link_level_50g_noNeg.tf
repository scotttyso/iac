#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-50g_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 50g_noNeg
*/
resource "aci_fabric_if_pol" "link_level_50g_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "50g_noNeg"
    name_alias      =  "None"
    speed           =  "50G"
}

