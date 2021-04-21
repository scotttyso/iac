/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-dmz"
GUI Location:
 - Tenants > Create Tenant > dmz
*/
resource "aci_tenant" "dmz" {
    annotation                      = "None"
    description                     = "Example DMZ Tenant"
    name                            = "dmz"
    name_alias                      = "None"
    relation_fv_rs_tenant_mon_pol   = ""
}

