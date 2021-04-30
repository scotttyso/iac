#------------------------------------------
# Create CDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-cdpDisabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : cdpDisabled
*/
resource "aci_cdp_interface_policy" "cdp_cdpDisabled" {
    admin_st    = "disabled"
    name        = "cdpDisabled"
    name_alias  = "None"
}

