#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-common/brc-Mgmt_Out/subj-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out > Mgmt_Out
*/
resource "aci_contract_subject" "Tenant_common_Contract_Type_Standard_Mgmt_Out_Subj_Mgmt_Out" {
    depends_on                      = [
        aci_contract.Tenant_common_Contract_Type_Standard_Mgmt_Out,
        aci_filter.Tenant_common_Filter_Mgmt_Out,
    ]
    contract_dn                     = aci_contract.Tenant_common_Contract_Type_Standard_Mgmt_Out.id
    name                            = "Mgmt_Out"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.Tenant_common_Filter_Mgmt_Out.id,
    ]
}

