#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_Out
*/
resource "aci_filter" "Tenant_mgmt_Filter_Mgmt_Out" {
    depends_on                      = [
        aci_tenant.Tenant_mgmt
    ]
    tenant_dn                       = aci_tenant.Tenant_mgmt.id
    description                     = "Management Outbound Traffic"
    name                            = "Mgmt_Out"
    relation_vz_rs_filt_graph_att   = ""
    relation_vz_rs_fwd_r_flt_p_att  = ""
    relation_vz_rs_rev_r_flt_p_att  = ""
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_Out/e-ip"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_Out > Filter Entry: ip
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_Out_Entry_ip" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_Out
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_Out.id
    description     = "Allow All IP"
    name            = "ip"
    ether_t         = "ip"
    prot            = "unspecified"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "unspecified"
    d_to_port       = "unspecified"
    stateful        = "no"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_Out/e-icmp"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_Out > Filter Entry: icmp
*/
resource "aci_filter_entry" "Tenant_mgmt_Filter_Mgmt_Out_Entry_icmp" {
    depends_on      = [
        aci_tenant.Tenant_mgmt,
        aci_filter.Tenant_mgmt_Filter_Mgmt_Out
    ]
    filter_dn       = aci_filter.Tenant_mgmt_Filter_Mgmt_Out.id
    description     = "Allow ICMP"
    name            = "icmp"
    ether_t         = "ip"
    prot            = "icmp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "unspecified"
    d_to_port       = "unspecified"
    stateful        = "no"
}

