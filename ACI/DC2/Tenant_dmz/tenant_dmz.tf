/*
GUI Location:
 - Tenants > Create Tenant > dmz
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-dmz"
*/
resource "aci_tenant" "dmz" {
	description    = "Example DMZ Tenant"
	name           = "dmz"
}

