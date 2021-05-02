/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-nets"
GUI Location:
 - Tenants > prod > Application Profiles > nets
*/
resource "aci_application_profile" "Tenant_prod_App_Profile_nets" {
    depends_on                  = [
        aci_tenant.Tenantprod,
    ]
    tenant_dn                   = aci_tenant.Tenantprod.id
    name                        = "nets"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}
