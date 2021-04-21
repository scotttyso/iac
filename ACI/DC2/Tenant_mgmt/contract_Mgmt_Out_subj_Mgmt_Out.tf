#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_Out/subj-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out > Mgmt_Out
*/
resource "aci_contract_subject" "mgmt_contract_subject_Mgmt_Out" {
    depends_on                      = [
        aci_contract.mgmt_contract_Mgmt_Out,
        aci_filter.mgmt_filter_Mgmt_Out.id
    ]
    contract_dn                     = aci_contract.mgmt_contract_Mgmt_Out.id
    annotation                      = "None"
    name                            = "Mgmt_Out"
    name_alias                      = "None"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "no"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.mgmt_filter_Mgmt_Out.id,
    ]
}

#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_Out/subj-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out > Mgmt_Out
*/
resource "aci_contract_subject" "mgmt_contract_subject_Mgmt_Out" {
    depends_on                      = [
        aci_contract.mgmt_contract_Mgmt_Out,
        aci_filter.mgmt_filter_Mgmt_Out.id
    ]
    contract_dn                     = aci_contract.mgmt_contract_Mgmt_Out.id
    annotation                      = "None"
    name                            = "Mgmt_Out"
    name_alias                      = "None"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.mgmt_filter_Mgmt_Out.id,
    ]
}

