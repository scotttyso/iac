/*
- This Resource File will create Recommended Default Policies for Tenants - infra
*/

/*
Assign Data Source for Tenants
- infra
*/
data "aci_tenant" "infra" {
	name	= "infra"
}