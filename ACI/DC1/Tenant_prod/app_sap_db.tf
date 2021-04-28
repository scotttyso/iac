/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-sap_db"
GUI Location:
 - Tenants > prod > Application Profiles > sap_db
*/
resource "aci_application_profile" "prod_sap_db" {
    depends_on                  = [
        aci_tenant.prod
    ]
    tenant_dn                   = aci_tenant.prod.id
    name                        = "sap_db"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}

