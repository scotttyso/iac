#------------------------------------------
# Add Data Source for Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/brc-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out
*/
data "aci_contract" "Tenant_common_Contract_Type__Mgmt_Out" {
    depends_on  = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn   = data.aci_tenant.Tenant_common.id
    name        = "Mgmt_Out"
}

