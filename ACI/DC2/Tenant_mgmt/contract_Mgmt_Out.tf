/*
Create the Contracts to be used by the Inband Management EPG
 - Mgmt_In_Ct
 - Mgmt_Out_Ct
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-mgmt/brc-{Contract Name}"
GUI Location:
 - Tenants > mgmt > Contracts > Standard: {Contract Name}
*/
resource "aci_contract" "mgmt_contract_Mgmt_Out" {
    depends_on  = [aci_tenant.mgmt]
    tenant_dn   = aci_tenant.mgmt.id
    annotation  = "None"
    description = "Mgmt Outbound Traffic"
    name        = "Mgmt_Out"
    name_alias  = "None"
    prio        = "unspecified"
    scope       = "tenant"
    target_dscp = "unspecified"
}

