/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-infra"
GUI Location:
 - Tenants > Create Tenant > infra
*/
data "aci_tenant" "infra" {
    name        = "infra"
}

