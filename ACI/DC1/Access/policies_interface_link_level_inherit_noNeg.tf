#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-inherit_noNeg"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : inherit_noNeg
*/
resource "aci_fabric_if_pol" "link_level_inherit_noNeg" {
    auto_neg        =  "off"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "inherit_noNeg"
    name_alias      =  "None"
    speed           =  "inherit"
}

