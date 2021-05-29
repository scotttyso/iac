#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-mgmt/oobbrc-Mgmt_Out/subj-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Out-Of-Band Contracts: Mgmt_Out > Mgmt_Out
*/
resource "aci_contract_subject" "Tenant_mgmt_Contract_Type_OOB_Mgmt_Out_Subj_Mgmt_Out" {
    depends_on                      = [
        aci_rest.Tenant_mgmt_Contract_Type_OOB_Mgmt_Out,
        aci_filter.Tenant_mgmt_Filter_Mgmt_Out,
    ]
    contract_dn                     = aci_rest.Tenant_mgmt_Contract_Type_OOB_Mgmt_Out.id
    name                            = "Mgmt_Out"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.Tenant_mgmt_Filter_Mgmt_Out.id,
    ]
}

