/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-common"
GUI Location:
 - Tenants > Create Tenant > common
*/
data "aci_tenant" "common" {
    name        = "common"
}

