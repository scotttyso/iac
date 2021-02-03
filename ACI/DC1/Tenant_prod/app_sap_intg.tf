/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-sap_intg"
GUI Location:
 - Tenants > prod > Application Profiles > sap_intg
*/
resource "aci_application_profile" "prod_sap_intg" {
	depends_on 					= [aci_tenant.prod]
	tenant_dn					= aci_tenant.prod.id
	name						= "sap_intg"
	prio						= "level3"
/*
	relation_fv_rs_ctx_mon_pol	= "uni/tn-common/monepg-default"
*/
}

