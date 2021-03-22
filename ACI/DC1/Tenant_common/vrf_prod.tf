/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-prod"
GUI Location:
 - Tenants > common > Networking > VRFs > prod
*/
resource "aci_vrf" "prod" {
    depends_on                              = [data.aci_tenant.common]
    tenant_dn                               = data.aci_tenant.common.id
    name                                    = "prod"
    bd_enforced_enable                      = "no"
    ip_data_plane_learning                    = "enabled"
    knw_mcast_act                           = "permit"
    pc_enf_dir                                = "ingress"
    pc_enf_pref                                = "enforced"
    relation_fv_rs_ctx_to_ep_ret            = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol                = "uni/tn-common/monepg-default"
/*
*/
}

/*
GUI Location:
 - Tenants > common > Networking > VRFs > prod: Policy >  Preferred Group
*/
resource "aci_any" "Preferred_Grp_prod" {
    depends_on                     = [aci_vrf.prod]
    vrf_dn                         = "uni/tn-common/ctx-prod"
    description                    = "Preferred Group for common prod"
    pref_gr_memb                     = "enabled"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-common/ctx-prod/snmpctx"
GUI Location:
 - Tenants > common > Networking > VRFs > prod > Create SNMP Context
*/
resource "aci_rest" "prod_snmp_ctx" {
    depends_on      = [data.aci_tenant.common,aci_vrf.prod]
    path            = "/api/node/mo/uni/tn-common/ctx-prod/snmpctx.json"
    class_name      = "snmpCtxP"
    payload         = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-common/ctx-prod/snmpctx",
            "name": "prod",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

