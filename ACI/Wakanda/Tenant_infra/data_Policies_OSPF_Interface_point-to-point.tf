#------------------------------------------------
# Create a OSPF Interface Policy
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfPol"
 - Distinguished Name: "/uni/tn-common/ospfIfPol-point-to-point"
GUI Location:
Tenants > common > Networking > Policies > Protocol > OSPF >  OSPF Interface > point-to-point
*/
data "aci_ospf_interface_policy" "Tenant_common_Policy_OSPF_Interface_point-to-point" {
    depends_on      = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn       = data.aci_tenant.Tenant_common.id
    name            = "point-to-point"
}

