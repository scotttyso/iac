/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-community_health"
GUI Location:
 - Tenants > Create Tenant > community_health
*/
resource "aci_tenant" "Tenant_community_health" {
    description                     = "Test Tenant for Community Demo"
    name                            = "community_health"
    relation_fv_rs_tenant_mon_pol   = ""
}

