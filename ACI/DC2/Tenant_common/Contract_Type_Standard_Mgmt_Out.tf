#------------------------------------------
# Create a Standard Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/brc-Mgmt_Out"
GUI Location:
 - Tenants > common > Contracts > Standard: Mgmt_Out
*/
resource "aci_contract" "Tenant_common_Contract_Type_Standard_Mgmt_Out" {
    depends_on  = [
        aci_tenant.Tenant_common
    ]
    tenant_dn   = aci_tenant.Tenant_common.id
    description = "Mgmt Outbound Traffic"
    name        = "Mgmt_Out"
    prio        = "unspecified"
    scope       = "tenant"
    target_dscp = "unspecified"
}

