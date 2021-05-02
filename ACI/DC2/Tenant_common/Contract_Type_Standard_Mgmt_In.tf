#------------------------------------------
# Create a Standard Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/brc-Mgmt_In"
GUI Location:
 - Tenants > common > Contracts > Standard: Mgmt_In
*/
resource "aci_contract" "Tenant_common_Contract_Type_Standard_Mgmt_In" {
    depends_on  = [
        aci_tenant.Tenant_common
    ]
    tenant_dn   = aci_tenant.Tenant_common.id
    description = "Mgmt Inbound Traffic"
    name        = "Mgmt_In"
    prio        = "unspecified"
    scope       = "tenant"
    target_dscp = "unspecified"
}

