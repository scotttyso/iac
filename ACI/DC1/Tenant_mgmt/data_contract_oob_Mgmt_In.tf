#------------------------------------------
# Add Data Source for Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-oob_Mgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: oob_Mgmt_In
*/
data "aci_contract" "mgmt_contract_oob_Mgmt_In" {
    tenant_dn    = data.aci_tenant.mgmt.id
    name        = "mgmt"
}


