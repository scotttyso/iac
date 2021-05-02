/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-common"
GUI Location:
 - Tenants > Create Tenant > common
*/
resource "aci_tenant" "Tenant_common" {
    description                     = "Built-In Common Tenant"
    name                            = "common"
    relation_fv_rs_tenant_mon_pol   = ""
}

