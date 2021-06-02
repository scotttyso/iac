#------------------------------------------------
# Create a BGP Peer Connectivity Data File
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerPfxPol"
 - Distinguished Name: "uni/tn-common/bgpPfxP-default"
GUI Location:
 - Tenants > common > Networking > Policies > Protocol > BGP >  BGP Peer Prefix > default
*/
data "aci_bgp_peer_prefix" "Tenant_common_Policy_BGP_Prefix_default" {
    depends_on      = [
        data.aci_tenant.Tenant_common
    ]
    tenant_dn       = data.aci_tenant.Tenant_common.id
    name            = "default"
}

