/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[access]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access]
*/
data "aci_vlan_pool" "VLAN_Pool_access" {
    name        = "access"
    alloc_mode  = "static"
}

