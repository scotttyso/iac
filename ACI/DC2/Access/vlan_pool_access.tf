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
resource "aci_vlan_pool" "VLAN_Pool_access" {
    alloc_mode  = "static"
    description = "Access VLAN Pool"
    name        = "access"
    name_alias  = "None"
}

