#------------------------------------------
# Create Port-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lacpLagPol"
 - Distinguished Name: "uni/infra/lacplagp-macPin"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Channel : macPin
*/
resource "aci_lacp_policy" "LACP_macPin" {
    ctrl        = ["fast-sel-hot-stdby","graceful-conv","susp-individual"]
    description = "MAC Pinning"
    max_links   = "16"
    min_links   = "1"
    name        = "macPin"
    mode        = "mac-pin"
}

