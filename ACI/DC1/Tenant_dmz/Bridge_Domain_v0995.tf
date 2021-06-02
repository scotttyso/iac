/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-dmz/BD-v0995"
GUI Location:
 - Tenants > dmz > Networking > Bridge Domains > v0995
*/
resource "aci_bridge_domain" "Tenant_dmz_Bridge_Domain_v0995" {
    depends_on                                  = [
        aci_tenant.Tenant_dmz,
        data.aci_tenant.Tenant_common,
        data.aci_vrf.Tenant_common_VRF_dmz,
    ]
    tenant_dn                                   = aci_tenant.Tenant_dmz.id
    description                                 = "Network Centric"
    name                                        = "v0995"
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
    relation_fv_rs_ctx                          = data.aci_vrf.Tenant_common_VRF_dmz.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

