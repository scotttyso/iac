/*
API Information:
 - Class: "fvCtx"
 - Distinguished Name: "uni/tn-common/ctx-dmz"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz
*/
resource "aci_vrf" "common_dmz" {
    depends_on                              = [data.aci_tenant.common]
    tenant_dn                               = data.aci_tenant.common.id
    bd_enforced_enable                      = "no"
    ip_data_plane_learning                  = "enabled"
    knw_mcast_act                           = "permit"
    name                                    = "dmz"
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
GUI Location:
 - Tenants > common > Networking > VRFs > dmz > EPG Collection for VRF: [Provided/Consumed Contracts]
*/
resource "aci_any" "vzAny_dmz" {
    depends_on                      = [aci_vrf.dmz]
    vrf_dn                          = "uni/tn-common/ctx-dmz"
    description                     = "vzAny for common dmz"
    match_t                         = "AtleastOne"
    relation_vz_rs_any_to_cons      = [data.aci_contract.default.id]
    relation_vz_rs_any_to_prov      = [data.aci_contract.default.id]
}

/*
API Information:
 - Class: "snmpCtxP"
 - Distinguished Name: "uni/tn-common/ctx-dmz/snmpctx"
GUI Location:
 - Tenants > common > Networking > VRFs > dmz > Create SNMP Context
*/
resource "aci_rest" "dmz_snmp_ctx" {
    depends_on  = [
        aci_tenant.common,
        aci_vrf.common_dmz
    ]
    path        = "/api/node/mo/uni/tn-common/ctx-dmz/snmpctx.json"
    class_name  = "snmpCtxP"
    payload     = <<EOF
{
    "snmpCtxP": {
        "attributes": {
            "dn": "uni/tn-common/ctx-dmz/snmpctx",
            "name": "dmz",
            "rn": "snmpctx"
        },
        "children": []
    }
}
    EOF
}

