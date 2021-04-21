/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-dmz/BD-v0996"
GUI Location:
 - Tenants > dmz > Networking > Bridge Domains > v0996
*/
resource "aci_bridge_domain" "dmz_v0996" {
    depends_on                                  = [aci_tenant.dmz,data.aci_tenant.common,data.aci_vrf.dmz,data.aci_l3_outside.None_None]
    tenant_dn                                   = aci_tenant.dmz.id
    description                                 = "Network Centric"
    name                                        = "v0996"
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
    relation_fv_rs_ctx                          = data.aci_vrf.dmz.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = data.aci_l3_outside.None_None.id
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

