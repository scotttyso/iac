/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "uni/tn-[Tenant]/ap-nets"
GUI Location:
 - Tenants > dmz > Application Profiles > nets
*/
resource "aci_application_profile" "dmz_nets" {
    depends_on                  = [
        aci_tenant.dmz
    ]
    tenant_dn                   = aci_tenant.dmz.id
    name                        = "nets"
    prio                        = "unspecified"
/*
    relation_fv_rs_ctx_mon_pol  = "uni/tn-common/monepg-default"
*/
}

