/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-prod/BD-sap_app/subnet-[5.5.5.1/24]"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > sap_app > Subnets
*/
resource "aci_subnet" "sap_app_5-5-5-0_24" {
	depends_on							= [aci_bridge_domain.sap_app.id]
	parent_dn							= aci_bridge_domain.sap_app.id
	description							= "SAP App Subnet"
	ip									= "5.5.5.1/24"
	ctrl								= ["nd"]
	preferred							= "no"
	scope								= ["public"]
	virtual								= "no"
	relation_fv_rs_bd_subnet_to_out		= "uni/tn-common/out-prod_L3"
}

