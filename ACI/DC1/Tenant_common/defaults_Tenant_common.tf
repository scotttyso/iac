/*
- This Resource File will create Recommended Default Policies for Tenants - common
*/

/*
Assign Data Source for Tenants
- common
Tenant common - Default Contract
*/
data "aci_tenant" "common" {
	name	= "common"
}

data "aci_contract" "default" {
	tenant_dn	= data.aci_tenant.common.id
	name		= "default"
}

data "aci_l3_domain_profile" "L3Out" {
	name        = "L3Out"
}
