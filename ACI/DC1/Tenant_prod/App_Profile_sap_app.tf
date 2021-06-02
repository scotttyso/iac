/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-sap_app"
GUI Location:
 - Tenants > prod > Application Profiles > sap_app
*/
resource "aci_application_profile" "Tenant_prod_App_Profile_sap_app" {
    depends_on                  = [
        aci_tenant.Tenant_prod,
    ]
    tenant_dn                   = aci_tenant.Tenant_prod.id
    name                        = "sap_app"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}

