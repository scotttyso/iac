#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-10g_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 10g_noNeg
*/
resource "aci_fabric_if_pol" "Link_Level_10g_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "10g_noNeg"
    name_alias      =  "None"
    speed           =  "10G"
}

