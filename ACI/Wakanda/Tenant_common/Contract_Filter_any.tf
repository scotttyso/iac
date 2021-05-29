#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-common/fltany"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: any
*/
resource "aci_filter" "Tenant_common_Filter_any" {
    depends_on                      = [
        aci_tenant.Tenant_common
    ]
    tenant_dn                       = aci_tenant.Tenant_common.id
    description                     = "Default Filter"
    name                            = "any"
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
 - Distinguished Name: "uni/tn-common/fltany/e-any"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: any > Filter Entry: any
*/
resource "aci_filter_entry" "Tenant_common_Filter_any_Entry_any" {
    depends_on      = [
        aci_tenant.Tenant_common,
        aci_filter.Tenant_common_Filter_any
    ]
    filter_dn       = aci_filter.Tenant_common_Filter_any.id
    description     = "Allow Any"
    name            = "any"
    ether_t         = "unspecified"
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

