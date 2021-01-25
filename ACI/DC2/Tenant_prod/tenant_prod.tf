/*
GUI Location:
 - Tenants > Create Tenant > prod
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-prod"
*/
resource "aci_tenant" "prod" {
	description    = "Example Prod Tenant"
	name           = "prod"
}

