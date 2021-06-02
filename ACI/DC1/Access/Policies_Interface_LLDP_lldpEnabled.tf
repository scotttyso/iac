#------------------------------------------
# Create LLDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-lldpEnabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > LLDP Interface : lldpEnabled
*/
resource "aci_lldp_interface_policy" "LLDP_lldpEnabled" {
    admin_rx_st =  "enabled"
    admin_tx_st =  "enabled"
    name        =  "lldpEnabled"
    name_alias  =  "None"
}

