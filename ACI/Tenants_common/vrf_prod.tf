/*
 This File will include Policies Related to Tenant "common" VRF "prod"
*/

/*
API Information:
- Class is "fvCtx"
- URI is "uni/tn-common/ctx-prod"
GUI Location:
- Tenants > common > Networking > VRFs > prod
*/
resource "aci_vrf" "prod" {
    depends_on                              = [aci_tenant.common.id]
    tenant_dn                               = aci_tenant.common.id
    name                                    = "prod"
    bd_enforced_enable                      = "no"
    ip_data_plane_learning			        = "enabled"
    knw_mcast                               = "permit"
    pc_enf_dir						        = "ingress"
    pc_enf_pref						        = "enforced"
    relation_fv_rs_ctx_to_ep_ret		    = "uni/tn-common/epRPol-default"
    relation_fv_rs_ctx_mon_pol		        = "uni/tn-common/monepg-default"
}

/*
API Information:
- Class is "snmpCtxP"
- URI is "uni/tn-common/ctx-prod/snmpctx"
GUI Location:
- Tenants > common > Networking > VRFs > prod > Create SNMP Context
*/
resource "aci_rest" "prod_snmp_ctx" {
    depends_on      = [aci_tenant.common,aci_vrf.prod]
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

