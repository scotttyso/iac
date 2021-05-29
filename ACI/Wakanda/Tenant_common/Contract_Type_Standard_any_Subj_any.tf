#------------------------------------------
# Create Contract Subject
#------------------------------------------

/*
API Information:
 - Class: "vzSubj"
 - Distinguished Name: "uni/tn-common/brc-any/subj-any"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: any > any
*/
resource "aci_contract_subject" "Tenant_common_Contract_Type_Standard_any_Subj_any" {
    depends_on                      = [
        aci_contract.Tenant_common_Contract_Type_Standard_any,
        aci_filter.Tenant_common_Filter_any,
    ]
    contract_dn                     = aci_contract.Tenant_common_Contract_Type_Standard_any.id
    name                            = "any"
    cons_match_t                    = "AtleastOne"
    prov_match_t                    = "AtleastOne"
    prio                            = "unspecified"
    rev_flt_ports                   = "yes"
    target_dscp                     = "unspecified"
    relation_vz_rs_subj_filt_att    = [
        aci_filter.Tenant_common_Filter_any.id,
    ]
}

