/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-mgmt"
GUI Location:
 - Tenants > Create Tenant > mgmt
*/
data "aci_tenant" "mgmt" {
    name        = "mgmt"
}

