#------------------------------------------
# Create a Standard Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: Mgmt_In
*/
resource "aci_contract" "Tenant_mgmt_Contract_Type_Standard_Mgmt_In" {
    depends_on  = [
        aci_tenant.Tenant_mgmt
    ]
    tenant_dn   = aci_tenant.Tenant_mgmt.id
    description = "Mgmt Inbound Traffic"
    name        = "Mgmt_In"
    prio        = "unspecified"
    scope       = "global"
    target_dscp = "unspecified"
}

