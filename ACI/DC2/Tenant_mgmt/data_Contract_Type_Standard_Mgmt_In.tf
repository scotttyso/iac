#------------------------------------------
# Add Data Source for Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/brc-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_In
*/
data "aci_contract" "Tenant_common_Contract_Type_Standard_Mgmt_In" {
    depends_on  = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn   = data.aci_tenant.Tenant_common.id
    name        = "Mgmt_In"
}

