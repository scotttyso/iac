/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-common"
GUI Location:
 - Tenants > Create Tenant > common
*/
resource "aci_tenant" "common" {
    annotation                      = "None"
    description                     = "Built-In Common Tenant"
    name                            = "common"
    name_alias                      = "None"
    relation_fv_rs_tenant_mon_pol   = ""
}

