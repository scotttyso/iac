/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-mgmt/BD-inb"
GUI Location:
 - Tenants > mgmt > Networking > Bridge Domains > inb
*/
resource "aci_bridge_domain" "Tenant_mgmt_Bridge_Domain_inb" {
    depends_on                                  = [
        aci_tenant.Tenant_mgmt,
        aci_vrf.Tenant_mgmt_VRF_inb,
        aci_l3_outside.Tenant_mgmt_L3Out_inband,
    ]
    tenant_dn                                   = aci_tenant.Tenant_mgmt.id
    description                                 = "Inband Bridge Domain"
    name                                        = "inb"
    arp_flood                                   = "no"
    bridge_domain_type                          = "regular"
    ep_clear                                    = "no"
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
    relation_fv_rs_ctx                          = aci_vrf.Tenant_mgmt_VRF_inb.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = [aci_l3_outside.Tenant_mgmt_L3Out_inband.id]
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-mgmt/BD-inb/subnet-[10.96.0.254/24]"
GUI Location:
 - Tenants > mgmt > Networking > Bridge Domains > inb > Subnets
*/
resource "aci_subnet" "Tenant_mgmt_Bridge_Domain_inb_Subnet_10-96-0-0_24" {
    depends_on                          = [
        aci_tenant.Tenant_mgmt,
        aci_bridge_domain.Tenant_mgmt_Bridge_Domain_inb
    ]
    parent_dn                           = aci_bridge_domain.Tenant_mgmt_Bridge_Domain_inb.id
    ctrl                                = ["nd"]
    description                         = "Wakanda Inband Subnet"
    ip                                  = "10.96.0.254/24"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

