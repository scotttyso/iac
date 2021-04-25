/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-mgmt/BD-inb"
GUI Location:
 - Tenants > mgmt > Networking > Bridge Domains > inb
*/
resource "aci_bridge_domain" "mgmt_inb" {
    depends_on                                  = [
        data.aci_tenant.mgmt,
        aci_vrf.inb,
        data.aci_l3_outside.mgmt_inband_L3
    ]
    tenant_dn                                   = data.aci_tenant.mgmt.id
    description                                 = "Inband Bridge Domain"
    name                                        = "inb"
    arp_flood                                   = "no"
    bridge_domain_type                          = "regular"
    ep_clear                                    = "no"
    ep_move_detect_mode                         = "None"
    host_based_routing                          = "no"
    intersite_bum_traffic_allow                 = "no"
    intersite_l2_stretch                        = "no"
    ip_learning                                 = "yes"
    ipv6_mcast_allow                            = "no"
    limit_ip_learn_to_subnets                   = "yes"
    mcast_allow                                 = "no"
    multi_dst_pkt_act                           = "bd-flood"
    optimize_wan_bandwidth                      = "no"
    unicast_route                               = "yes"
    unk_mac_ucast_act                           = "proxy"
    unk_mcast_act                               = "flood"
    relation_fv_rs_ctx                          = aci_vrf.inb.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = data.aci_l3_outside.mgmt_inband_L3.id
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

