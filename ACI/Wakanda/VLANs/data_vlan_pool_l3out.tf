/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out]
*/
data "aci_vlan_pool" "VLAN_Pool_l3out" {
    name        = "l3out"
    alloc_mode  = "static"
}

