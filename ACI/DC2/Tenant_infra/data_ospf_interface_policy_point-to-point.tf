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
data "aci_ospf_interface_policy" "common_ospf_interface_policy_point-to-point" {
    depends_on      = [
        data.aci_tenant.common
    ]
    tenant_dn       = data.aci_tenant.common.id
    name            = "point-to-point"
}

