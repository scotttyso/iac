/*
API Information:
 - Class: "fvBD"
 - Distinguised Name: "/uni/tn-prod/BD-sap_db"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > sap_db
*/
resource "aci_bridge_domain" "Tenant_prod_Bridge_Domain_sap_db" {
    depends_on                                  = [
        aci_tenant.Tenant_prod,
        data.aci_tenant.Tenant_prod,
        data.aci_vrf.Tenant_common_VRF_prod,
        data.aci_l3_outside.Tenant_prod_L3Out_dc2-prod_L3,
    ]
    tenant_dn                                   = data.ci_tenant.Tenant_prod.id
    description                                 = "SAP DB BD"
    name                                        = "sap_db"
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
    relation_fv_rs_ctx                          = aci_vrf.Tenant_prod_VRF_prod.id
    relation_fv_rs_abd_pol_mon_pol              = "uni/tn-common/monepg-default"
    relation_fv_rs_bd_to_out                    = [data.aci_l3_outside.Tenant_prod_L3Out_dc2-prod_L3.id]
    relation_fv_rs_bd_to_ep_ret                 = "uni/tn-common/epRPol-default"
    relation_fv_rs_mldsn                        = "uni/tn-common/mldsnoopPol-default"
    relation_fv_rs_bd_to_nd_p                   = "uni/tn-common/ndifpol-default"
    relation_fv_rs_bd_to_fhs                    = "uni/tn-common/bdpol-default"
    relation_fv_rs_igmpsn                       = "uni/tn-common/snPol-default"
}

/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "/uni/tn-prod/BD-sap_db/subnet-[2001:db8::1/64]"
GUI Location:
 - Tenants > prod > Networking > Bridge Domains > sap_db > Subnets
*/
resource "aci_subnet" "Tenant_prod_Bridge_Domain_sap_db_Subnet_2001-db8--_64" {
    depends_on                          = [
        aci_tenant.Tenant_prod,
        aci_bridge_domain.Tenant_prod_Bridge_Domain_sap_db
    ]
    parent_dn                           = aci_bridge_domain.Tenant_prod_Bridge_Domain_sap_db.id
    ctrl                                = ["nd"]
    description                         = "SAP DB Subnet"
    ip                                  = "2001:db8::1/64"
    preferred                           = "no"
    scope                               = ["public"]
    virtual                             = "no"
}

