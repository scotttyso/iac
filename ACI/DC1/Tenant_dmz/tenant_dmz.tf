/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-dmz"
GUI Location:
 - Tenants > Create Tenant > dmz
*/
resource "aci_tenant" "dmz" {
	description    = "Example DMZ Tenant"
	name           = "dmz"
}

