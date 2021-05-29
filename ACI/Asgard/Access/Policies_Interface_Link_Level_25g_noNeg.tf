#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-25g_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 25g_noNeg
*/
resource "aci_fabric_if_pol" "Link_Level_25g_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "25g_noNeg"
    name_alias      =  "None"
    speed           =  "25G"
}

