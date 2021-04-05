#------------------------------------------
# Create CDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-cdpDisable"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : cdpDisable
*/
resource "aci_cdp_interface_policy" "cdpDisable" {
    admin_st    = "disabled"
    name        = "cdpDisable"
    name_alias  = "None"
}

