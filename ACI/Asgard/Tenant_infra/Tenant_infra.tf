/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-infra"
GUI Location:
 - Tenants > Create Tenant > infra
*/
resource "aci_tenant" "Tenant_infra" {
    description                     = "Built-In infra Tenant"
    name                            = "infra"
    relation_fv_rs_tenant_mon_pol   = ""
}

