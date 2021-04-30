#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-inherit_Auto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : inherit_Auto
*/
resource "aci_fabric_if_pol" "link_level_inherit_Auto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "inherit_Auto"
    name_alias      =  "None"
    speed           =  "inherit"
}

