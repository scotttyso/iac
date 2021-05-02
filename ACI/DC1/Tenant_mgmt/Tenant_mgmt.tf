/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-mgmt"
GUI Location:
 - Tenants > Create Tenant > mgmt
*/
resource "aci_tenant" "Tenant_mgmt" {
    description                     = "Built-In mgmt Tenant"
    name                            = "mgmt"
    relation_fv_rs_tenant_mon_pol   = ""
}

