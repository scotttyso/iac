/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[access]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access]
*/
data "aci_vlan_pool" "vlan_pool_access" {
    name        = "access"
    alloc_mode  = "static"
}

