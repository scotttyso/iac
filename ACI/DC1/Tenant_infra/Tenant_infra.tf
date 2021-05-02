/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-infra"
GUI Location:
 - Tenants > Create Tenant > infra
*/
resource "aci_tenant" "Tenant_infra" {
    annotation                      = "None"
    description                     = "Built-In infra Tenant"
    name                            = "infra"
    name_alias                      = "None"
    relation_fv_rs_tenant_mon_pol   = ""
}

