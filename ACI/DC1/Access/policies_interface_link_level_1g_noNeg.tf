#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-1g_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 1g_noNeg
*/
resource "aci_fabric_if_pol" "link_level_1g_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "1g_noNeg"
    name_alias      =  "None"
    speed           =  "1G"
}

