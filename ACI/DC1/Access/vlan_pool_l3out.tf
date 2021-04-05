#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out]
*/
resource "aci_vlan_pool" "l3out" {
    alloc_mode  = "static"
    description = "L3Out VLAN Pool"
    name        = "l3out"
    name_alias  = "None"
}

