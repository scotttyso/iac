#------------------------------------------
# Create Port-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lacpLagPol"
 - Distinguished Name: "uni/infra/lacplagp-macPinNicLoad"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Channel : macPinNicLoad
*/
resource "aci_lacp_policy" "macPinNicLoad" {
    ctrl        = ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]
    max_links   = "16"
    min_links   = "1"
    name        = "macPinNicLoad"
    mode        = "mac-pin-nicload"
}

