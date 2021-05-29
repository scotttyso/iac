/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-dmz"
GUI Location:
 - Tenants > Create Tenant > dmz
*/
resource "aci_tenant" "Tenant_dmz" {
    description                     = "Sample DMZ Tenant"
    name                            = "dmz"
    relation_fv_rs_tenant_mon_pol   = ""
}

