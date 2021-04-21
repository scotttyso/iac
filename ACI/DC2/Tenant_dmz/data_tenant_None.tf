/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-None"
GUI Location:
 - Tenants > Create Tenant > None
*/
data "aci_tenant" "None" {
    name        = "None"
}

