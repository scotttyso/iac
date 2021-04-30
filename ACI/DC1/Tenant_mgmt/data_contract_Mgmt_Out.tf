#------------------------------------------
# Add Data Source for Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out
*/
data "aci_contract" "mgmt_contract_Mgmt_Out" {
    depends_on  = [
        data.aci_tenant.mgmt
    ]
    tenant_dn   = data.aci_tenant.mgmt.id
    name        = "mgmt"
}


