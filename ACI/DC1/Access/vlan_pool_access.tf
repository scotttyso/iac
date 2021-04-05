#------------------------------------------
# Create VLAN Pools
#------------------------------------------

/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[access]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access]
*/
resource "aci_vlan_pool" "access" {
    alloc_mode  = "static"
    description = "Access VLAN Pool"
    name        = "access"
    name_alias  = "None"
}

