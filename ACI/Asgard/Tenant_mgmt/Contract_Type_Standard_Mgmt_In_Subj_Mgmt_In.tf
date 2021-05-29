#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_In/subj-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_In > Mgmt_In
*/
resource "aci_contract_subject" "Tenant_mgmt_Contract_Type_Standard_Mgmt_In_Subj_Mgmt_In" {
    depends_on                      = [
        aci_contract.Tenant_mgmt_Contract_Type_Standard_Mgmt_In,
        aci_filter.Tenant_mgmt_Filter_Mgmt_In,
    ]
    contract_dn                     = aci_contract.Tenant_mgmt_Contract_Type_Standard_Mgmt_In.id
    name                            = "Mgmt_In"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.Tenant_mgmt_Filter_Mgmt_In.id,
    ]
}

