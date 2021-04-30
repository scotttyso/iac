#------------------------------------------
# Create LLDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-lldp_Tx"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > LLDP Interface : lldp_Tx
*/
resource "aci_lldp_interface_policy" "lldp_lldp_Tx" {
    admin_rx_st =  "disabled"
    admin_tx_st =  "enabled"
    name        =  "lldp_Tx"
    name_alias  =  "None"
}

