/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[dynamic]-dynamic"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[dynamic]
*/
data "aci_vlan_pool" "dynamic" {
    name        = "dynamic"
    alloc_mode  = "dynamic"
}

