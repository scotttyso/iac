#------------------------------------------
# Create LLDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-lldp_Rx"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > LLDP Interface : lldp_Rx
*/
resource "aci_lldp_interface_policy" "lldp_Rx" {
    admin_rx_st =  "enabled"
    admin_tx_st =  "disabled"
    name        =  "lldp_Rx"
    name_alias  =  "None"
}

