/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-mgmt"
GUI Location:
 - Tenants > Create Tenant > mgmt
*/
resource "aci_tenant" "Tenant_mgmt" {
    annotation                      = "None"
    description                     = "Built-In mgmt Tenant"
    name                            = "mgmt"
    name_alias                      = "None"
    relation_fv_rs_tenant_mon_pol   = ""
}

