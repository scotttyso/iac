#------------------------------------------
# Create a Taboos Contract
#------------------------------------------

/*
API Information:
 - Class: "vzBrCP"
 - Distinguished Name: "uni/tn-common/taboo-taboo_contract"
GUI Location:
 - Tenants > common > Contracts > Taboos: taboo_contract
*/
resource "aci_taboo_contract" "Tenant_common_Contract_Type_Taboo_taboo_contract" {
    depends_on  = [
        aci_tenant.Tenant_common,
    ]
    tenant_dn   = aci_tenant.Tenant_common.id
    description = "A Taboo Contract"
    name        = "taboo_contract"
}

