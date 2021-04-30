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
data "aci_bgp_peer_prefix" "common_bgp_pfx_policy_default" {
    depends_on      = [
        data.aci_tenant.common
    ]
    tenant_dn       = data.aci_tenant.common.id
    name            = "default"
}

