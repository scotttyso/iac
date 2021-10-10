/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-route_leak"
GUI Location:
 - Tenants > Create Tenant > route_leak
*/
resource "aci_tenant" "Tenant_route_leak" {
    description                     = "Test Route Leaking Tenant"
    name                            = "route_leak"
    relation_fv_rs_tenant_mon_pol   = ""
}

