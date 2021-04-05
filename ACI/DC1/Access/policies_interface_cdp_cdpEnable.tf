#------------------------------------------
# Create CDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-cdpEnable"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > CDP Interface : cdpEnable
*/
resource "aci_cdp_interface_policy" "cdpEnable" {
    admin_st    = "enabled"
    name        = "cdpEnable"
    name_alias  = "None"
}

