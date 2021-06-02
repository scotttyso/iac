#------------------------------------------
# Create Interface Link Level Policies
#------------------------------------------

/*
API Information:
 - Class: "fabricHIfPol"
 - Distinguished Name: "uni/infra/hintfpol-100mAuto"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Link Level : 100mAuto
*/
resource "aci_fabric_if_pol" "Link_Level_100mAuto" {
    auto_neg        =  "on"
    fec_mode        =  "inherit"
    link_debounce   =  "100"
    name            =  "100mAuto"
    name_alias      =  "None"
    speed           =  "100M"
}

