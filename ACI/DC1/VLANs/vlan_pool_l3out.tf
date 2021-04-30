/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-4]-to-[vlan-4]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_l3out_4" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_l3out.id
    from            = "vlan-4"
    to              = "vlan-4"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-901]-to-[vlan-901]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_l3out_901" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_l3out.id
    from            = "vlan-901"
    to              = "vlan-901"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-911]-to-[vlan-911]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_l3out_911" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_l3out.id
    from            = "vlan-911"
    to              = "vlan-911"
}

