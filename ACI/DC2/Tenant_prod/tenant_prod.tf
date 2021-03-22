/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-prod"
GUI Location:
 - Tenants > Create Tenant > prod
*/
resource "aci_tenant" "prod" {
    description    = "Updated Tenant Description"
    name           = "prod"
}

