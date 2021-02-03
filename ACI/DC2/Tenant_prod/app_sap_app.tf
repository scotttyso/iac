/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-sap_app"
GUI Location:
 - Tenants > prod > Application Profiles > sap_app
*/
resource "aci_application_profile" "prod_sap_app" {
	depends_on 					= [aci_tenant.prod]
	tenant_dn					= aci_tenant.prod.id
	name						= "sap_app"
	prio						= "level3"
/*
	relation_fv_rs_ctx_mon_pol	= "uni/tn-common/monepg-default"
*/
}

