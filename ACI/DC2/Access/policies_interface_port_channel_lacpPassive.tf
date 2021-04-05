#------------------------------------------
# Create Port-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lacpLagPol"
 - Distinguished Name: "uni/infra/lacplagp-lacpPassive"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Channel : lacpPassive
*/
resource "aci_lacp_policy" "lacpPassive" {
    ctrl        = ["fast-sel-hot-stdby", "graceful-conv", "susp-individual"]
    max_links   = "16"
    min_links   = "1"
    name        = "lacpPassive"
    mode        = "passive"
}

