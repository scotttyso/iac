/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-prod/BD-v3019"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > v3019
*/
resource "aci_bridge_domain" "prod_v3019" {
    depends_on                                  = [
        aci_tenant.prod,
        data.aci_tenant.prod,
        data.aci_vrf.prod_prod,
        data.aci_l3_outside.prod_l3out_None
    ]
    tenant_dn                                   = data.ci_tenant.prod.id
    description                                 = "Network Centric"
    name                                        = "v3019"
    arp_flood                                   = "yes"
    bridge_domain_type                          = "regular"
    ep_clear                                    = "no"
    ep_move_detect_mode                         = "garp"
    host_based_routing                          = "no"
    intersite_bum_traffic_allow                 = "no"
    intersite_l2_stretch                        = "no"
    ip_learning                                 = "yes"
    ipv6_mcast_allow                            = "no"
    limit_ip_learn_to_subnets                   = "yes"
    mcast_allow                                 = "no"
    multi_dst_pkt_act                           = "bd-flood"
    optimize_wan_bandwidth                      = "no"
    unicast_route                               = "no"
    unk_mac_ucast_act                           = "flood"
    unk_mcast_act                               = "flood"
    relation_fv_rs_ctx                          = aci_vrf.prod_prod.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

