#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-40g_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 40g_noNeg
*/
resource "aci_fabric_if_pol" "link_level_40g_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "40g_noNeg"
    name_alias      =  "None"
    speed           =  "40G"
}

