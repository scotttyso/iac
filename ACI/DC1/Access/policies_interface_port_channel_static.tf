#------------------------------------------
# Create Port-Channel Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lacpLagPol"
 - Distinguished Name: "uni/infra/lacplagp-static"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > Port Channel : static
*/
resource "aci_lacp_policy" "lacp_static" {
    ctrl        = ["fast-sel-hot-stdby","graceful-conv","susp-individual"]
    description = "LLDP Rx Enabled"
    max_links   = "16"
    min_links   = "1"
    name        = "static"
    mode        = "off"
}

