/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-prod"
GUI Location:
 - Tenants > Create Tenant > prod
*/
resource "aci_tenant" "prod" {
    annotation                      = "None"
    description                     = "Updated Tenant Description"
    name                            = "prod"
    name_alias                      = "None"
    relation_fv_rs_tenant_mon_pol   = ""
}

