#------------------------------------------
# Create Contract Filter
#------------------------------------------

/*
API Information:
 - Class: "vzFilter"
 - Distinguished Name: "uni/tn-mgmt/fltMgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Filters: Mgmt_In
*/
resource "aci_filter" "mgmt_filter_Mgmt_In" {
    depends_on                      = [aci_tenant.mgmt]
    tenant_dn                       = aci_tenant.mgmt.id
    annotation                      = "None"
    description                     = "Mgmt Inbound Traffic"
    name                            = "Mgmt_In"
    name_alias                      = "None"
    relation_vz_rs_filt_graph_att   = ""
    relation_vz_rs_fwd_r_flt_p_att  = ""
    relation_vz_rs_rev_r_flt_p_att  = ""
}

