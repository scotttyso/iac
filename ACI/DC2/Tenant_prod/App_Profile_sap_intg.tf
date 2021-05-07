/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-sap_intg"
GUI Location:
 - Tenants > prod > Application Profiles > sap_intg
*/
resource "aci_application_profile" "Tenant_prod_App_Profile_sap_intg" {
    depends_on                  = [
        aci_tenant.Tenant_prod,
    ]
    tenant_dn                   = aci_tenant.Tenant_prod.id
    description                 = "SAP Intg"
    name                        = "sap_intg"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}

