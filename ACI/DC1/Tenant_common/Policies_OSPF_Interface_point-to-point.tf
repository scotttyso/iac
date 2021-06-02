#------------------------------------------------
# Create a OSPF Interface Policy
#------------------------------------------------

/*
API Information:
 - Class: "ospfIfPol"
 - Distinguished Name: "/uni/tn-common/ospfIfPol-point-to-point"
GUI Location:
 - Tenants > common > Networking > Policies > Protocol > OSPF >  OSPF Interface > point-to-point
*/
resource "aci_ospf_interface_policy" "Tenant_common_Policy_OSPF_Interface_point-to-point" {
    depends_on      = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn       = data.aci_tenant.Tenant_common.id
    description     = "Point-to-Point Policy"
    name            = "point-to-point"
    cost            = "unspecified"
    ctrl            = "bfd"
    dead_intvl      = "40"
    hello_intvl     = "10"
    nw_t            = "p2p"
    # pfx_suppress    = ""
    prio            = "1"
    rexmit_intvl    = "5"
    xmit_delay      = "1"
}

