#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-common/fltMgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In
*/
resource "aci_filter" "Tenant_common_Filter_Mgmt_In" {
    depends_on                      = [
        aci_tenant.common
    ]
    tenant_dn                       = aci_tenant.common.id
    description                     = "Management Inbound Traffic"
    name                            = "Mgmt_In"
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
 - Distinguished Name: "uni/tn-common/fltMgmt_In/e-https"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: https
*/
resource "aci_filter_entry" "Tenant_common_Filter_Mgmt_In_Entry_https" {
    depends_on      = [
        aci_tenant.common,
        aci_filter.Tenant_common_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_common_Filter_Mgmt_In.id
    description     = "Allow HTTPS"
    name            = "https"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "https"
    d_to_port       = "https"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-common/fltMgmt_In/e-icmp"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: icmp
*/
resource "aci_filter_entry" "Tenant_common_Filter_Mgmt_In_Entry_icmp" {
    depends_on      = [
        aci_tenant.common,
        aci_filter.Tenant_common_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_common_Filter_Mgmt_In.id
    description     = "Allow ICMP"
    name            = "icmp"
    ether_t         = "ip"
    prot            = "udp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "161"
    d_to_port       = "161"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-common/fltMgmt_In/e-snmp"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: snmp
*/
resource "aci_filter_entry" "Tenant_common_Filter_Mgmt_In_Entry_snmp" {
    depends_on      = [
        aci_tenant.common,
        aci_filter.Tenant_common_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_common_Filter_Mgmt_In.id
    description     = "Allow SNMP"
    name            = "snmp"
    ether_t         = "ip"
    prot            = "udp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "161"
    d_to_port       = "161"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

#------------------------------------------
# Create Contract Filter Entry
#------------------------------------------

/*
API Information:
 - Class: "vzEntry"
 - Distinguished Name: "uni/tn-common/fltMgmt_In/e-ssh"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In > Filter Entry: ssh
*/
resource "aci_filter_entry" "Tenant_common_Filter_Mgmt_In_Entry_ssh" {
    depends_on      = [
        aci_tenant.common,
        aci_filter.Tenant_common_Filter_Mgmt_In
    ]
    filter_dn       = aci_filter.Tenant_common_Filter_Mgmt_In.id
    description     = "Allow SSH"
    name            = "ssh"
    ether_t         = "ip"
    prot            = "tcp"
    arp_opc         = "unspecified"
    icmpv4_t        = "unspecified"
    icmpv6_t        = "unspecified"
    match_dscp      = "unspecified"
    apply_to_frag   = "no"
    s_from_port     = "unspecified"
    s_to_port       = "unspecified"
    d_from_port     = "22"
    d_to_port       = "22"
    stateful        = "yes"
    tcp_rules       = "unspecified"
}

