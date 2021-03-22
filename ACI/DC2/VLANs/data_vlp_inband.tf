/*
API Information:
 - Class: "fvnsVlanInstP"
 - Distinguished Name: "uni/infra/vlanns-[inband]-static"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[inband]
*/
data "aci_vlan_pool" "inband" {
    name        = "inband"
    alloc_mode    = "static"
}

