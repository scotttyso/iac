#------------------------------------------
# Create CDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-cdpEnabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : cdpEnabled
*/
resource "aci_cdp_interface_policy" "CDP_cdpEnabled" {
    admin_st    = "enabled"
    name        = "cdpEnabled"
    name_alias  = "None"
}

