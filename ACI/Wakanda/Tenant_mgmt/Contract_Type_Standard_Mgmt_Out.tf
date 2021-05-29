#------------------------------------------
# Create a Standard Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_Out
*/
resource "aci_contract" "Tenant_mgmt_Contract_Type_Standard_Mgmt_Out" {
    depends_on  = [
        aci_tenant.Tenant_mgmt
    ]
    tenant_dn   = aci_tenant.Tenant_mgmt.id
    description = "Mgmt Outbound Traffic"
    name        = "Mgmt_Out"
    prio        = "unspecified"
    scope       = "global"
    target_dscp = "unspecified"
}

