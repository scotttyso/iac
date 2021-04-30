/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1]-to-[vlan-1]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1"
    to              = "vlan-1"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2]-to-[vlan-2]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_2" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-2"
    to              = "vlan-2"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-3]-to-[vlan-3]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_3" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-3"
    to              = "vlan-3"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-4]-to-[vlan-4]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_4" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-4"
    to              = "vlan-4"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-5]-to-[vlan-5]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_5" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-5"
    to              = "vlan-5"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-6]-to-[vlan-6]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_6" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-6"
    to              = "vlan-6"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-7]-to-[vlan-7]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_7" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-7"
    to              = "vlan-7"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-8]-to-[vlan-8]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_8" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-8"
    to              = "vlan-8"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-9]-to-[vlan-9]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_9" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-9"
    to              = "vlan-9"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-10]-to-[vlan-10]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_10" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-10"
    to              = "vlan-10"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-11]-to-[vlan-11]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_11" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-11"
    to              = "vlan-11"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-12]-to-[vlan-12]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_12" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-12"
    to              = "vlan-12"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-13]-to-[vlan-13]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_13" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-13"
    to              = "vlan-13"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-14]-to-[vlan-14]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_14" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-14"
    to              = "vlan-14"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-15]-to-[vlan-15]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_15" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-15"
    to              = "vlan-15"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-16]-to-[vlan-16]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_16" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-16"
    to              = "vlan-16"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-17]-to-[vlan-17]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_17" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-17"
    to              = "vlan-17"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-18]-to-[vlan-18]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_18" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-18"
    to              = "vlan-18"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-19]-to-[vlan-19]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_19" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-19"
    to              = "vlan-19"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-20]-to-[vlan-20]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_20" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-20"
    to              = "vlan-20"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-21]-to-[vlan-21]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_21" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-21"
    to              = "vlan-21"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-22]-to-[vlan-22]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_22" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-22"
    to              = "vlan-22"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-23]-to-[vlan-23]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_23" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-23"
    to              = "vlan-23"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-24]-to-[vlan-24]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_24" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-24"
    to              = "vlan-24"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-25]-to-[vlan-25]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_25" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-25"
    to              = "vlan-25"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-26]-to-[vlan-26]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_26" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-26"
    to              = "vlan-26"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-27]-to-[vlan-27]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_27" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-27"
    to              = "vlan-27"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-28]-to-[vlan-28]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_28" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-28"
    to              = "vlan-28"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-29]-to-[vlan-29]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_29" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-29"
    to              = "vlan-29"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-30]-to-[vlan-30]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_30" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-30"
    to              = "vlan-30"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-31]-to-[vlan-31]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_31" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-31"
    to              = "vlan-31"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-32]-to-[vlan-32]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_32" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-32"
    to              = "vlan-32"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-33]-to-[vlan-33]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_33" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-33"
    to              = "vlan-33"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-34]-to-[vlan-34]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_34" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-34"
    to              = "vlan-34"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-35]-to-[vlan-35]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_35" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-35"
    to              = "vlan-35"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-36]-to-[vlan-36]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_36" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-36"
    to              = "vlan-36"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-37]-to-[vlan-37]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_37" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-37"
    to              = "vlan-37"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-38]-to-[vlan-38]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_38" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-38"
    to              = "vlan-38"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-39]-to-[vlan-39]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_39" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-39"
    to              = "vlan-39"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-40]-to-[vlan-40]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_40" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-40"
    to              = "vlan-40"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-41]-to-[vlan-41]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_41" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-41"
    to              = "vlan-41"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-42]-to-[vlan-42]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_42" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-42"
    to              = "vlan-42"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-43]-to-[vlan-43]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_43" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-43"
    to              = "vlan-43"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-44]-to-[vlan-44]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_44" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-44"
    to              = "vlan-44"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-45]-to-[vlan-45]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_45" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-45"
    to              = "vlan-45"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-46]-to-[vlan-46]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_46" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-46"
    to              = "vlan-46"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-47]-to-[vlan-47]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_47" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-47"
    to              = "vlan-47"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-48]-to-[vlan-48]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_48" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-48"
    to              = "vlan-48"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-49]-to-[vlan-49]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_49" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-49"
    to              = "vlan-49"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-50]-to-[vlan-50]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_50" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-50"
    to              = "vlan-50"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-51]-to-[vlan-51]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_51" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-51"
    to              = "vlan-51"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-52]-to-[vlan-52]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_52" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-52"
    to              = "vlan-52"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-53]-to-[vlan-53]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_53" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-53"
    to              = "vlan-53"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-54]-to-[vlan-54]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_54" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-54"
    to              = "vlan-54"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-55]-to-[vlan-55]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_55" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-55"
    to              = "vlan-55"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-56]-to-[vlan-56]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_56" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-56"
    to              = "vlan-56"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-57]-to-[vlan-57]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_57" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-57"
    to              = "vlan-57"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-58]-to-[vlan-58]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_58" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-58"
    to              = "vlan-58"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-59]-to-[vlan-59]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_59" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-59"
    to              = "vlan-59"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-60]-to-[vlan-60]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_60" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-60"
    to              = "vlan-60"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-61]-to-[vlan-61]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_61" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-61"
    to              = "vlan-61"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-62]-to-[vlan-62]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_62" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-62"
    to              = "vlan-62"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-63]-to-[vlan-63]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_63" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-63"
    to              = "vlan-63"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-64]-to-[vlan-64]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_64" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-64"
    to              = "vlan-64"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-65]-to-[vlan-65]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_65" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-65"
    to              = "vlan-65"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-66]-to-[vlan-66]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_66" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-66"
    to              = "vlan-66"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-67]-to-[vlan-67]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_67" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-67"
    to              = "vlan-67"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-68]-to-[vlan-68]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_68" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-68"
    to              = "vlan-68"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-69]-to-[vlan-69]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_69" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-69"
    to              = "vlan-69"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-70]-to-[vlan-70]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_70" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-70"
    to              = "vlan-70"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-71]-to-[vlan-71]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_71" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-71"
    to              = "vlan-71"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-72]-to-[vlan-72]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_72" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-72"
    to              = "vlan-72"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-73]-to-[vlan-73]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_73" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-73"
    to              = "vlan-73"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-74]-to-[vlan-74]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_74" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-74"
    to              = "vlan-74"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-75]-to-[vlan-75]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_75" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-75"
    to              = "vlan-75"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-76]-to-[vlan-76]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_76" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-76"
    to              = "vlan-76"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-77]-to-[vlan-77]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_77" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-77"
    to              = "vlan-77"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-78]-to-[vlan-78]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_78" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-78"
    to              = "vlan-78"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-79]-to-[vlan-79]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_79" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-79"
    to              = "vlan-79"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-80]-to-[vlan-80]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_80" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-80"
    to              = "vlan-80"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-81]-to-[vlan-81]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_81" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-81"
    to              = "vlan-81"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-82]-to-[vlan-82]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_82" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-82"
    to              = "vlan-82"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-83]-to-[vlan-83]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_83" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-83"
    to              = "vlan-83"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-84]-to-[vlan-84]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_84" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-84"
    to              = "vlan-84"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-85]-to-[vlan-85]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_85" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-85"
    to              = "vlan-85"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-86]-to-[vlan-86]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_86" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-86"
    to              = "vlan-86"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-87]-to-[vlan-87]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_87" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-87"
    to              = "vlan-87"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-88]-to-[vlan-88]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_88" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-88"
    to              = "vlan-88"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-89]-to-[vlan-89]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_89" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-89"
    to              = "vlan-89"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-90]-to-[vlan-90]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_90" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-90"
    to              = "vlan-90"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-91]-to-[vlan-91]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_91" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-91"
    to              = "vlan-91"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-92]-to-[vlan-92]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_92" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-92"
    to              = "vlan-92"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-93]-to-[vlan-93]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_93" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-93"
    to              = "vlan-93"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-94]-to-[vlan-94]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_94" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-94"
    to              = "vlan-94"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-95]-to-[vlan-95]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_95" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-95"
    to              = "vlan-95"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-96]-to-[vlan-96]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_96" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-96"
    to              = "vlan-96"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-97]-to-[vlan-97]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_97" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-97"
    to              = "vlan-97"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-98]-to-[vlan-98]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_98" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-98"
    to              = "vlan-98"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-99]-to-[vlan-99]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_99" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-99"
    to              = "vlan-99"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-100]-to-[vlan-100]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_100" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-100"
    to              = "vlan-100"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-101]-to-[vlan-101]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_101" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-101"
    to              = "vlan-101"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-102]-to-[vlan-102]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_102" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-102"
    to              = "vlan-102"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-103]-to-[vlan-103]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_103" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-103"
    to              = "vlan-103"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-104]-to-[vlan-104]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_104" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-104"
    to              = "vlan-104"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-105]-to-[vlan-105]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_105" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-105"
    to              = "vlan-105"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-106]-to-[vlan-106]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_106" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-106"
    to              = "vlan-106"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-107]-to-[vlan-107]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_107" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-107"
    to              = "vlan-107"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-108]-to-[vlan-108]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_108" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-108"
    to              = "vlan-108"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-109]-to-[vlan-109]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_109" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-109"
    to              = "vlan-109"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-110]-to-[vlan-110]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_110" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-110"
    to              = "vlan-110"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-111]-to-[vlan-111]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_111" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-111"
    to              = "vlan-111"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-112]-to-[vlan-112]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_112" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-112"
    to              = "vlan-112"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-113]-to-[vlan-113]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_113" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-113"
    to              = "vlan-113"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-114]-to-[vlan-114]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_114" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-114"
    to              = "vlan-114"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-115]-to-[vlan-115]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_115" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-115"
    to              = "vlan-115"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-116]-to-[vlan-116]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_116" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-116"
    to              = "vlan-116"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-117]-to-[vlan-117]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_117" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-117"
    to              = "vlan-117"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-118]-to-[vlan-118]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_118" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-118"
    to              = "vlan-118"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-119]-to-[vlan-119]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_119" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-119"
    to              = "vlan-119"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-120]-to-[vlan-120]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_120" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-120"
    to              = "vlan-120"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-121]-to-[vlan-121]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_121" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-121"
    to              = "vlan-121"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-122]-to-[vlan-122]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_122" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-122"
    to              = "vlan-122"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-123]-to-[vlan-123]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_123" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-123"
    to              = "vlan-123"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-124]-to-[vlan-124]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_124" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-124"
    to              = "vlan-124"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-125]-to-[vlan-125]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_125" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-125"
    to              = "vlan-125"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-126]-to-[vlan-126]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_126" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-126"
    to              = "vlan-126"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-127]-to-[vlan-127]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_127" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-127"
    to              = "vlan-127"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-128]-to-[vlan-128]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_128" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-128"
    to              = "vlan-128"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-129]-to-[vlan-129]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_129" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-129"
    to              = "vlan-129"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-130]-to-[vlan-130]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_130" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-130"
    to              = "vlan-130"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-131]-to-[vlan-131]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_131" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-131"
    to              = "vlan-131"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-132]-to-[vlan-132]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_132" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-132"
    to              = "vlan-132"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-133]-to-[vlan-133]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_133" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-133"
    to              = "vlan-133"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-134]-to-[vlan-134]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_134" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-134"
    to              = "vlan-134"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-135]-to-[vlan-135]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_135" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-135"
    to              = "vlan-135"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-136]-to-[vlan-136]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_136" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-136"
    to              = "vlan-136"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-137]-to-[vlan-137]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_137" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-137"
    to              = "vlan-137"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-138]-to-[vlan-138]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_138" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-138"
    to              = "vlan-138"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-139]-to-[vlan-139]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_139" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-139"
    to              = "vlan-139"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-140]-to-[vlan-140]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_140" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-140"
    to              = "vlan-140"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-141]-to-[vlan-141]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_141" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-141"
    to              = "vlan-141"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-142]-to-[vlan-142]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_142" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-142"
    to              = "vlan-142"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-143]-to-[vlan-143]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_143" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-143"
    to              = "vlan-143"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-144]-to-[vlan-144]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_144" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-144"
    to              = "vlan-144"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-145]-to-[vlan-145]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_145" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-145"
    to              = "vlan-145"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-146]-to-[vlan-146]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_146" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-146"
    to              = "vlan-146"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-147]-to-[vlan-147]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_147" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-147"
    to              = "vlan-147"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-148]-to-[vlan-148]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_148" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-148"
    to              = "vlan-148"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-149]-to-[vlan-149]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_149" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-149"
    to              = "vlan-149"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-150]-to-[vlan-150]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_150" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-150"
    to              = "vlan-150"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-151]-to-[vlan-151]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_151" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-151"
    to              = "vlan-151"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-152]-to-[vlan-152]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_152" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-152"
    to              = "vlan-152"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-153]-to-[vlan-153]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_153" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-153"
    to              = "vlan-153"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-154]-to-[vlan-154]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_154" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-154"
    to              = "vlan-154"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-155]-to-[vlan-155]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_155" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-155"
    to              = "vlan-155"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-156]-to-[vlan-156]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_156" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-156"
    to              = "vlan-156"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-157]-to-[vlan-157]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_157" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-157"
    to              = "vlan-157"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-158]-to-[vlan-158]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_158" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-158"
    to              = "vlan-158"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-159]-to-[vlan-159]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_159" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-159"
    to              = "vlan-159"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-160]-to-[vlan-160]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_160" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-160"
    to              = "vlan-160"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-161]-to-[vlan-161]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_161" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-161"
    to              = "vlan-161"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-162]-to-[vlan-162]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_162" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-162"
    to              = "vlan-162"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-163]-to-[vlan-163]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_163" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-163"
    to              = "vlan-163"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-164]-to-[vlan-164]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_164" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-164"
    to              = "vlan-164"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-165]-to-[vlan-165]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_165" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-165"
    to              = "vlan-165"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-166]-to-[vlan-166]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_166" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-166"
    to              = "vlan-166"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-167]-to-[vlan-167]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_167" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-167"
    to              = "vlan-167"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-168]-to-[vlan-168]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_168" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-168"
    to              = "vlan-168"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-169]-to-[vlan-169]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_169" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-169"
    to              = "vlan-169"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-170]-to-[vlan-170]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_170" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-170"
    to              = "vlan-170"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-171]-to-[vlan-171]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_171" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-171"
    to              = "vlan-171"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-172]-to-[vlan-172]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_172" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-172"
    to              = "vlan-172"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-173]-to-[vlan-173]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_173" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-173"
    to              = "vlan-173"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-174]-to-[vlan-174]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_174" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-174"
    to              = "vlan-174"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-175]-to-[vlan-175]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_175" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-175"
    to              = "vlan-175"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-176]-to-[vlan-176]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_176" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-176"
    to              = "vlan-176"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-177]-to-[vlan-177]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_177" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-177"
    to              = "vlan-177"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-178]-to-[vlan-178]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_178" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-178"
    to              = "vlan-178"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-179]-to-[vlan-179]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_179" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-179"
    to              = "vlan-179"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-180]-to-[vlan-180]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_180" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-180"
    to              = "vlan-180"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-181]-to-[vlan-181]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_181" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-181"
    to              = "vlan-181"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-182]-to-[vlan-182]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_182" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-182"
    to              = "vlan-182"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-183]-to-[vlan-183]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_183" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-183"
    to              = "vlan-183"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-184]-to-[vlan-184]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_184" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-184"
    to              = "vlan-184"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-185]-to-[vlan-185]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_185" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-185"
    to              = "vlan-185"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-186]-to-[vlan-186]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_186" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-186"
    to              = "vlan-186"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-187]-to-[vlan-187]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_187" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-187"
    to              = "vlan-187"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-188]-to-[vlan-188]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_188" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-188"
    to              = "vlan-188"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-189]-to-[vlan-189]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_189" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-189"
    to              = "vlan-189"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-190]-to-[vlan-190]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_190" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-190"
    to              = "vlan-190"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-191]-to-[vlan-191]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_191" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-191"
    to              = "vlan-191"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-192]-to-[vlan-192]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_192" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-192"
    to              = "vlan-192"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-193]-to-[vlan-193]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_193" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-193"
    to              = "vlan-193"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-194]-to-[vlan-194]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_194" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-194"
    to              = "vlan-194"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-195]-to-[vlan-195]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_195" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-195"
    to              = "vlan-195"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-196]-to-[vlan-196]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_196" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-196"
    to              = "vlan-196"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-197]-to-[vlan-197]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_197" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-197"
    to              = "vlan-197"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-198]-to-[vlan-198]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_198" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-198"
    to              = "vlan-198"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-199]-to-[vlan-199]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_199" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-199"
    to              = "vlan-199"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1101]-to-[vlan-1101]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1101" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1101"
    to              = "vlan-1101"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1102]-to-[vlan-1102]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1102" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1102"
    to              = "vlan-1102"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1103]-to-[vlan-1103]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1103" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1103"
    to              = "vlan-1103"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1104]-to-[vlan-1104]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1104" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1104"
    to              = "vlan-1104"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1105]-to-[vlan-1105]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1105" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1105"
    to              = "vlan-1105"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1106]-to-[vlan-1106]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1106" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1106"
    to              = "vlan-1106"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1107]-to-[vlan-1107]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1107" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1107"
    to              = "vlan-1107"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1108]-to-[vlan-1108]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1108" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1108"
    to              = "vlan-1108"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1109]-to-[vlan-1109]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1109" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1109"
    to              = "vlan-1109"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1110]-to-[vlan-1110]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1110" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1110"
    to              = "vlan-1110"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1111]-to-[vlan-1111]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1111" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1111"
    to              = "vlan-1111"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1112]-to-[vlan-1112]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1112" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1112"
    to              = "vlan-1112"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1113]-to-[vlan-1113]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1113" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1113"
    to              = "vlan-1113"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1114]-to-[vlan-1114]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1114" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1114"
    to              = "vlan-1114"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1115]-to-[vlan-1115]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1115" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1115"
    to              = "vlan-1115"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1116]-to-[vlan-1116]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1116" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1116"
    to              = "vlan-1116"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1117]-to-[vlan-1117]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1117" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1117"
    to              = "vlan-1117"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1118]-to-[vlan-1118]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1118" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1118"
    to              = "vlan-1118"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1119]-to-[vlan-1119]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1119" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1119"
    to              = "vlan-1119"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1120]-to-[vlan-1120]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1120" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1120"
    to              = "vlan-1120"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1121]-to-[vlan-1121]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1121" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1121"
    to              = "vlan-1121"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1122]-to-[vlan-1122]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1122" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1122"
    to              = "vlan-1122"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1123]-to-[vlan-1123]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1123" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1123"
    to              = "vlan-1123"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1124]-to-[vlan-1124]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1124" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1124"
    to              = "vlan-1124"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1125]-to-[vlan-1125]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1125" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1125"
    to              = "vlan-1125"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1126]-to-[vlan-1126]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1126" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1126"
    to              = "vlan-1126"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1127]-to-[vlan-1127]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1127" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1127"
    to              = "vlan-1127"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1128]-to-[vlan-1128]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1128" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1128"
    to              = "vlan-1128"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1129]-to-[vlan-1129]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1129" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1129"
    to              = "vlan-1129"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1130]-to-[vlan-1130]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1130" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1130"
    to              = "vlan-1130"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1131]-to-[vlan-1131]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1131" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1131"
    to              = "vlan-1131"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1132]-to-[vlan-1132]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1132" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1132"
    to              = "vlan-1132"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1133]-to-[vlan-1133]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1133" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1133"
    to              = "vlan-1133"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1134]-to-[vlan-1134]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1134" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1134"
    to              = "vlan-1134"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1135]-to-[vlan-1135]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1135" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1135"
    to              = "vlan-1135"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1136]-to-[vlan-1136]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1136" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1136"
    to              = "vlan-1136"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1137]-to-[vlan-1137]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1137" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1137"
    to              = "vlan-1137"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1138]-to-[vlan-1138]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1138" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1138"
    to              = "vlan-1138"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1139]-to-[vlan-1139]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1139" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1139"
    to              = "vlan-1139"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1140]-to-[vlan-1140]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1140" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1140"
    to              = "vlan-1140"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1141]-to-[vlan-1141]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1141" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1141"
    to              = "vlan-1141"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1142]-to-[vlan-1142]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1142" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1142"
    to              = "vlan-1142"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1143]-to-[vlan-1143]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1143" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1143"
    to              = "vlan-1143"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1144]-to-[vlan-1144]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1144" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1144"
    to              = "vlan-1144"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1145]-to-[vlan-1145]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1145" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1145"
    to              = "vlan-1145"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1146]-to-[vlan-1146]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1146" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1146"
    to              = "vlan-1146"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1147]-to-[vlan-1147]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1147" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1147"
    to              = "vlan-1147"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1148]-to-[vlan-1148]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1148" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1148"
    to              = "vlan-1148"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1149]-to-[vlan-1149]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1149" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1149"
    to              = "vlan-1149"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1150]-to-[vlan-1150]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1150" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1150"
    to              = "vlan-1150"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1151]-to-[vlan-1151]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1151" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1151"
    to              = "vlan-1151"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1152]-to-[vlan-1152]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1152" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1152"
    to              = "vlan-1152"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1153]-to-[vlan-1153]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1153" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1153"
    to              = "vlan-1153"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1154]-to-[vlan-1154]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1154" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1154"
    to              = "vlan-1154"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1155]-to-[vlan-1155]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1155" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1155"
    to              = "vlan-1155"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1156]-to-[vlan-1156]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1156" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1156"
    to              = "vlan-1156"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1157]-to-[vlan-1157]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1157" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1157"
    to              = "vlan-1157"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1158]-to-[vlan-1158]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1158" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1158"
    to              = "vlan-1158"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1159]-to-[vlan-1159]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1159" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1159"
    to              = "vlan-1159"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1160]-to-[vlan-1160]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1160" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1160"
    to              = "vlan-1160"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1161]-to-[vlan-1161]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1161" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1161"
    to              = "vlan-1161"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1162]-to-[vlan-1162]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1162" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1162"
    to              = "vlan-1162"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1163]-to-[vlan-1163]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1163" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1163"
    to              = "vlan-1163"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1164]-to-[vlan-1164]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1164" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1164"
    to              = "vlan-1164"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1165]-to-[vlan-1165]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1165" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1165"
    to              = "vlan-1165"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1166]-to-[vlan-1166]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1166" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1166"
    to              = "vlan-1166"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1167]-to-[vlan-1167]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1167" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1167"
    to              = "vlan-1167"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1168]-to-[vlan-1168]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1168" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1168"
    to              = "vlan-1168"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1169]-to-[vlan-1169]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1169" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1169"
    to              = "vlan-1169"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1170]-to-[vlan-1170]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1170" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1170"
    to              = "vlan-1170"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1171]-to-[vlan-1171]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1171" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1171"
    to              = "vlan-1171"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1172]-to-[vlan-1172]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1172" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1172"
    to              = "vlan-1172"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1173]-to-[vlan-1173]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1173" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1173"
    to              = "vlan-1173"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1174]-to-[vlan-1174]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1174" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1174"
    to              = "vlan-1174"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1175]-to-[vlan-1175]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1175" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1175"
    to              = "vlan-1175"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1176]-to-[vlan-1176]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1176" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1176"
    to              = "vlan-1176"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1177]-to-[vlan-1177]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1177" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1177"
    to              = "vlan-1177"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1178]-to-[vlan-1178]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1178" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1178"
    to              = "vlan-1178"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1179]-to-[vlan-1179]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1179" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1179"
    to              = "vlan-1179"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1180]-to-[vlan-1180]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1180" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1180"
    to              = "vlan-1180"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1181]-to-[vlan-1181]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1181" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1181"
    to              = "vlan-1181"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1182]-to-[vlan-1182]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1182" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1182"
    to              = "vlan-1182"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1183]-to-[vlan-1183]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1183" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1183"
    to              = "vlan-1183"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1184]-to-[vlan-1184]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1184" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1184"
    to              = "vlan-1184"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1185]-to-[vlan-1185]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1185" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1185"
    to              = "vlan-1185"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1186]-to-[vlan-1186]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1186" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1186"
    to              = "vlan-1186"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1187]-to-[vlan-1187]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1187" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1187"
    to              = "vlan-1187"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1188]-to-[vlan-1188]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1188" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1188"
    to              = "vlan-1188"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1189]-to-[vlan-1189]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1189" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1189"
    to              = "vlan-1189"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1190]-to-[vlan-1190]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1190" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1190"
    to              = "vlan-1190"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1191]-to-[vlan-1191]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1191" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1191"
    to              = "vlan-1191"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1192]-to-[vlan-1192]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1192" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1192"
    to              = "vlan-1192"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1193]-to-[vlan-1193]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1193" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1193"
    to              = "vlan-1193"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1194]-to-[vlan-1194]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1194" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1194"
    to              = "vlan-1194"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1195]-to-[vlan-1195]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1195" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1195"
    to              = "vlan-1195"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1196]-to-[vlan-1196]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1196" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1196"
    to              = "vlan-1196"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1197]-to-[vlan-1197]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1197" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1197"
    to              = "vlan-1197"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1198]-to-[vlan-1198]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1198" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1198"
    to              = "vlan-1198"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1199]-to-[vlan-1199]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "vlan_range_access_1199" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.vlan_pool_access.id
    from            = "vlan-1199"
    to              = "vlan-1199"
}

