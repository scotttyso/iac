#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-common/taboo-taboo_contract/subj-taboo"
GUI Location:
 - Tenants > mgmt > Contracts > Taboos: taboo_contract > taboo
*/
resource "aci_contract_subject" "Tenant_common_Contract_Type_Taboo_taboo_contract_Subj_taboo" {
    depends_on                      = [
        aci_taboo_contract.Tenant_common_Contract_Type_Taboo_taboo_contract,
        aci_filter.Tenant_common_Filter_default,
    ]
    contract_dn                     = aci_taboo_contract.Tenant_common_Contract_Type_Taboo_taboo_contract.id
    name                            = "taboo"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.Tenant_common_Filter_default.id,
    ]
}

