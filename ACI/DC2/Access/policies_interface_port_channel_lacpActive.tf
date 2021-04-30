#------------------------------------------
# Create Port-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lacpLagPol"
 - Distinguished Name: "uni/infra/lacplagp-lacpActive"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Channel : lacpActive
*/
resource "aci_lacp_policy" "lacp_lacpActive" {
    ctrl        = ["fast-sel-hot-stdby","graceful-conv","susp-individual"]
    description = "LACP Active"
    max_links   = "16"
    min_links   = "1"
    name        = "lacpActive"
    mode        = "active"
}

