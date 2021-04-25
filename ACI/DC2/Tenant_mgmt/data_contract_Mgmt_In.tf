#------------------------------------------
# Add Data Source for Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_In
*/
data "aci_contract" "mgmt_contract_Mgmt_In" {
    tenant_dn    = data.aci_tenant.mgmt.id
    name        = "mgmt"
}


