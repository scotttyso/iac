#------------------------------------------
# Create a Standard Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/brc-any"
GUI Location:
 - Tenants > common > Contracts > Standard: any
*/
resource "aci_contract" "Tenant_common_Contract_Type_Standard_any" {
    depends_on  = [
        aci_tenant.Tenant_common
    ]
    tenant_dn   = aci_tenant.Tenant_common.id
    description = "Any Contract"
    name        = "any"
    prio        = "unspecified"
    scope       = "global"
    target_dscp = "unspecified"
}

