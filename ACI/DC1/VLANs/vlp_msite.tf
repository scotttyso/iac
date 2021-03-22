/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[msite]-static/from-[vlan-4]-to-[vlan-4]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[msite] > Encap Blocks
*/
resource "aci_ranges" "msite_4" {
    depends_on         = [data.aci_vlan_pool.msite]
    vlan_pool_dn    = "uni/infra/vlanns-[msite]-static"
    from            = "vlan-4"
    to                = "vlan-4"
}

