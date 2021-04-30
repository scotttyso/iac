/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-web"
GUI Location:
 - Tenants > common > Networking > VRFs > web
*/
resource "aci_vrf" "common_web" {
    depends_on                              = [data.aci_tenant.common]
    tenant_dn                               = data.aci_tenant.common.id
    bd_enforced_enable                      = "no"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "web"
    name_alias                              = "None"
    pc_enf_dir                              = "ingress"
    pc_enf_pref                             = "enforced"
    relation_fv_rs_ctx_to_ep_ret            = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bgp_ctx_pol              = "uni/tn-common/bgpCtxP-default"
/*
    relation_fv_rs_ctx_to_bgp_ctx_af_pol    = [uni/tn-common/bgpCtxAfP-default]
    relation_fv_rs_ctx_to_eigrp_ctx_af_pol  = [uni/tn-common/eigrpCtxAfP-default]
*/
    relation_fv_rs_ospf_ctx_pol             = "uni/tn-common/ospfCtxP-default"
    relation_fv_rs_vrf_validation_pol       = "uni/tn-common/vrfvalidationpol-default"
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-common/ctx-web/snmpctx"
GUI Location:
 - Tenants > common > Networking > VRFs > web > Create SNMP Context
*/
resource "aci_rest" "web_snmp_ctx" {
    depends_on  = [
        aci_tenant.common,
        aci_vrf.common_web
    ]
    path        = "/api/node/mo/uni/tn-common/ctx-web/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-common/ctx-web/snmpctx",
            "name": "web",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

