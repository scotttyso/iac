/*
- This Resource File will create Recommended Default Policies for Tenants - infra
*/

/*
Assign Data Source for Tenants
- infra
*/
data "aci_tenant" "infra" {
    name    = "infra"
}

data "aci_l3_domain_profile" "L3Out" {
    name        = "L3Out"
}
