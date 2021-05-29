#------------------------------------------
# Create an L2 Interface Policy
#------------------------------------------

/*
API Information:
 - Class: "l2IfPol"
 - Distinguished Name: "uni/infra/l2IfP-default"
GUI Location:
 - Fabric > Access Policies > Policies > Interface > L2 Interface : default
*/
resource "aci_l2_interface_policy" "L2_Interface_default" {
    name        =  "default"
    qinq        =  "disabled"
    vepa        =  "disabled"
    vlan_scope  =  "global"
}

