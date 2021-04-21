/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-nets"
GUI Location:
 - Tenants > prod > Application Profiles > nets
*/
resource "aci_application_profile" "prod_nets" {
    depends_on                  = [aci_tenant.prod]
    tenant_dn                   = aci_tenant.prod.id
    name                        = "nets"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}

