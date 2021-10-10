#------------------------------------------------
# Create a BGP Peer Connectivity Profile
#------------------------------------------------

/*
API Information:
 - Class: "bgpPeerPfxPol"
 - Distinguished Name: "uni/tn-common/bgpPfxP-default"
GUI Location:
 - Tenants > common > Networking > Policies > Protocol > BGP >  BGP Peer Prefix > default
*/
resource "aci_bgp_peer_prefix" "Tenant_common_Policy_BGP_Prefix_default" {
    depends_on      = [
        aci_tenant.Tenant_common,
    ]
    tenant_dn       = aci_tenant.Tenant_common.id
    action          = "log"
    description     = "Default Prefix Policy"
    name            = "default"
    max_pfx         = "20000"
    restart_time    = "infinite"
    thresh          = "75"
}

