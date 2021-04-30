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
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-902]-to-[vlan-902]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_l3out_902" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_l3out.id
    from            = "vlan-902"
    to              = "vlan-902"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-912]-to-[vlan-912]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_l3out_912" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_l3out.id
    from            = "vlan-912"
    to              = "vlan-912"
}

