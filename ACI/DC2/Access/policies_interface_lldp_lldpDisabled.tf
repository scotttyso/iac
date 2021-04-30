#------------------------------------------
# Create LLDP Interface Policies
#------------------------------------------

/*
API Information:
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-lldpDisabled"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > LLDP Interface : lldpDisabled
*/
resource "aci_lldp_interface_policy" "lldp_lldpDisabled" {
    admin_rx_st =  "disabled"
    admin_tx_st =  "disabled"
    name        =  "lldpDisabled"
    name_alias  =  "None"
}

