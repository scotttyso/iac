/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1]-to-[vlan-1]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_2" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_3" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_4" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_5" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_6" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_7" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_8" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_9" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_10" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_11" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_12" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_13" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_14" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_15" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_16" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_17" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_18" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_19" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_20" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_21" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_22" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_23" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_24" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_25" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_26" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_27" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_28" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_29" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_30" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_31" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_32" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_33" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_34" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_35" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_36" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_37" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_38" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_39" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_40" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_41" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_42" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_43" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_44" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_45" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_46" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_47" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_48" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_49" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_50" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_51" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_52" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_53" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_54" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_55" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_56" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_57" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_58" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_59" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_60" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_61" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_62" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_63" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_64" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_65" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_66" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_67" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_68" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_69" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_70" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_71" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_72" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_73" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_74" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_75" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_76" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_77" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_78" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_79" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_80" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_81" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_82" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_83" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_84" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_85" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_86" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_87" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_88" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_89" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_90" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_91" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_92" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_93" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_94" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_95" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_96" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_97" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_98" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_99" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_100" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-100"
    to              = "vlan-100"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-201]-to-[vlan-201]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_201" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-201"
    to              = "vlan-201"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-202]-to-[vlan-202]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_202" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-202"
    to              = "vlan-202"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-203]-to-[vlan-203]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_203" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-203"
    to              = "vlan-203"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-204]-to-[vlan-204]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_204" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-204"
    to              = "vlan-204"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-205]-to-[vlan-205]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_205" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-205"
    to              = "vlan-205"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-206]-to-[vlan-206]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_206" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-206"
    to              = "vlan-206"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-207]-to-[vlan-207]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_207" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-207"
    to              = "vlan-207"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-208]-to-[vlan-208]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_208" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-208"
    to              = "vlan-208"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-209]-to-[vlan-209]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_209" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-209"
    to              = "vlan-209"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-210]-to-[vlan-210]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_210" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-210"
    to              = "vlan-210"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-211]-to-[vlan-211]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_211" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-211"
    to              = "vlan-211"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-212]-to-[vlan-212]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_212" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-212"
    to              = "vlan-212"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-213]-to-[vlan-213]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_213" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-213"
    to              = "vlan-213"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-214]-to-[vlan-214]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_214" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-214"
    to              = "vlan-214"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-215]-to-[vlan-215]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_215" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-215"
    to              = "vlan-215"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-216]-to-[vlan-216]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_216" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-216"
    to              = "vlan-216"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-217]-to-[vlan-217]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_217" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-217"
    to              = "vlan-217"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-218]-to-[vlan-218]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_218" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-218"
    to              = "vlan-218"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-219]-to-[vlan-219]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_219" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-219"
    to              = "vlan-219"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-220]-to-[vlan-220]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_220" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-220"
    to              = "vlan-220"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-221]-to-[vlan-221]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_221" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-221"
    to              = "vlan-221"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-222]-to-[vlan-222]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_222" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-222"
    to              = "vlan-222"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-223]-to-[vlan-223]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_223" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-223"
    to              = "vlan-223"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-224]-to-[vlan-224]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_224" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-224"
    to              = "vlan-224"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-225]-to-[vlan-225]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_225" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-225"
    to              = "vlan-225"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-226]-to-[vlan-226]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_226" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-226"
    to              = "vlan-226"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-227]-to-[vlan-227]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_227" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-227"
    to              = "vlan-227"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-228]-to-[vlan-228]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_228" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-228"
    to              = "vlan-228"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-229]-to-[vlan-229]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_229" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-229"
    to              = "vlan-229"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-230]-to-[vlan-230]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_230" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-230"
    to              = "vlan-230"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-231]-to-[vlan-231]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_231" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-231"
    to              = "vlan-231"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-232]-to-[vlan-232]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_232" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-232"
    to              = "vlan-232"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-233]-to-[vlan-233]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_233" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-233"
    to              = "vlan-233"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-234]-to-[vlan-234]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_234" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-234"
    to              = "vlan-234"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-235]-to-[vlan-235]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_235" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-235"
    to              = "vlan-235"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-236]-to-[vlan-236]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_236" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-236"
    to              = "vlan-236"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-237]-to-[vlan-237]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_237" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-237"
    to              = "vlan-237"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-238]-to-[vlan-238]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_238" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-238"
    to              = "vlan-238"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-239]-to-[vlan-239]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_239" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-239"
    to              = "vlan-239"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-240]-to-[vlan-240]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_240" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-240"
    to              = "vlan-240"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-241]-to-[vlan-241]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_241" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-241"
    to              = "vlan-241"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-242]-to-[vlan-242]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_242" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-242"
    to              = "vlan-242"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-243]-to-[vlan-243]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_243" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-243"
    to              = "vlan-243"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-244]-to-[vlan-244]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_244" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-244"
    to              = "vlan-244"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-245]-to-[vlan-245]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_245" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-245"
    to              = "vlan-245"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-246]-to-[vlan-246]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_246" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-246"
    to              = "vlan-246"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-247]-to-[vlan-247]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_247" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-247"
    to              = "vlan-247"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-248]-to-[vlan-248]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_248" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-248"
    to              = "vlan-248"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-249]-to-[vlan-249]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_249" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-249"
    to              = "vlan-249"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-250]-to-[vlan-250]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_250" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-250"
    to              = "vlan-250"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-251]-to-[vlan-251]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_251" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-251"
    to              = "vlan-251"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-252]-to-[vlan-252]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_252" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-252"
    to              = "vlan-252"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-253]-to-[vlan-253]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_253" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-253"
    to              = "vlan-253"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-254]-to-[vlan-254]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_254" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-254"
    to              = "vlan-254"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-255]-to-[vlan-255]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_255" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-255"
    to              = "vlan-255"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-256]-to-[vlan-256]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_256" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-256"
    to              = "vlan-256"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-257]-to-[vlan-257]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_257" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-257"
    to              = "vlan-257"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-258]-to-[vlan-258]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_258" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-258"
    to              = "vlan-258"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-259]-to-[vlan-259]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_259" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-259"
    to              = "vlan-259"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-260]-to-[vlan-260]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_260" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-260"
    to              = "vlan-260"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-261]-to-[vlan-261]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_261" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-261"
    to              = "vlan-261"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-262]-to-[vlan-262]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_262" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-262"
    to              = "vlan-262"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-263]-to-[vlan-263]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_263" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-263"
    to              = "vlan-263"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-264]-to-[vlan-264]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_264" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-264"
    to              = "vlan-264"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-265]-to-[vlan-265]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_265" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-265"
    to              = "vlan-265"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-266]-to-[vlan-266]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_266" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-266"
    to              = "vlan-266"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-267]-to-[vlan-267]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_267" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-267"
    to              = "vlan-267"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-268]-to-[vlan-268]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_268" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-268"
    to              = "vlan-268"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-269]-to-[vlan-269]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_269" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-269"
    to              = "vlan-269"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-270]-to-[vlan-270]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_270" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-270"
    to              = "vlan-270"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-271]-to-[vlan-271]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_271" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-271"
    to              = "vlan-271"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-272]-to-[vlan-272]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_272" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-272"
    to              = "vlan-272"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-273]-to-[vlan-273]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_273" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-273"
    to              = "vlan-273"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-274]-to-[vlan-274]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_274" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-274"
    to              = "vlan-274"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-275]-to-[vlan-275]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_275" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-275"
    to              = "vlan-275"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-276]-to-[vlan-276]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_276" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-276"
    to              = "vlan-276"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-277]-to-[vlan-277]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_277" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-277"
    to              = "vlan-277"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-278]-to-[vlan-278]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_278" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-278"
    to              = "vlan-278"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-279]-to-[vlan-279]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_279" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-279"
    to              = "vlan-279"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-280]-to-[vlan-280]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_280" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-280"
    to              = "vlan-280"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-281]-to-[vlan-281]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_281" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-281"
    to              = "vlan-281"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-282]-to-[vlan-282]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_282" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-282"
    to              = "vlan-282"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-283]-to-[vlan-283]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_283" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-283"
    to              = "vlan-283"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-284]-to-[vlan-284]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_284" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-284"
    to              = "vlan-284"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-285]-to-[vlan-285]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_285" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-285"
    to              = "vlan-285"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-286]-to-[vlan-286]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_286" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-286"
    to              = "vlan-286"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-287]-to-[vlan-287]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_287" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-287"
    to              = "vlan-287"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-288]-to-[vlan-288]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_288" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-288"
    to              = "vlan-288"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-289]-to-[vlan-289]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_289" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-289"
    to              = "vlan-289"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-290]-to-[vlan-290]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_290" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-290"
    to              = "vlan-290"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-291]-to-[vlan-291]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_291" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-291"
    to              = "vlan-291"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-292]-to-[vlan-292]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_292" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-292"
    to              = "vlan-292"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-293]-to-[vlan-293]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_293" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-293"
    to              = "vlan-293"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-294]-to-[vlan-294]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_294" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-294"
    to              = "vlan-294"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-295]-to-[vlan-295]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_295" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-295"
    to              = "vlan-295"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-296]-to-[vlan-296]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_296" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-296"
    to              = "vlan-296"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-297]-to-[vlan-297]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_297" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-297"
    to              = "vlan-297"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-298]-to-[vlan-298]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_298" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-298"
    to              = "vlan-298"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-299]-to-[vlan-299]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_299" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-299"
    to              = "vlan-299"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1201]-to-[vlan-1201]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1201" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1201"
    to              = "vlan-1201"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1202]-to-[vlan-1202]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1202" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1202"
    to              = "vlan-1202"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1203]-to-[vlan-1203]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1203" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1203"
    to              = "vlan-1203"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1204]-to-[vlan-1204]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1204" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1204"
    to              = "vlan-1204"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1205]-to-[vlan-1205]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1205" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1205"
    to              = "vlan-1205"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1206]-to-[vlan-1206]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1206" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1206"
    to              = "vlan-1206"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1207]-to-[vlan-1207]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1207" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1207"
    to              = "vlan-1207"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1208]-to-[vlan-1208]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1208" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1208"
    to              = "vlan-1208"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1209]-to-[vlan-1209]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1209" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1209"
    to              = "vlan-1209"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1210]-to-[vlan-1210]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1210" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1210"
    to              = "vlan-1210"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1211]-to-[vlan-1211]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1211" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1211"
    to              = "vlan-1211"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1212]-to-[vlan-1212]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1212" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1212"
    to              = "vlan-1212"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1213]-to-[vlan-1213]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1213" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1213"
    to              = "vlan-1213"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1214]-to-[vlan-1214]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1214" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1214"
    to              = "vlan-1214"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1215]-to-[vlan-1215]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1215" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1215"
    to              = "vlan-1215"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1216]-to-[vlan-1216]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1216" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1216"
    to              = "vlan-1216"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1217]-to-[vlan-1217]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1217" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1217"
    to              = "vlan-1217"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1218]-to-[vlan-1218]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1218" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1218"
    to              = "vlan-1218"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1219]-to-[vlan-1219]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1219" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1219"
    to              = "vlan-1219"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1220]-to-[vlan-1220]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1220" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1220"
    to              = "vlan-1220"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1221]-to-[vlan-1221]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1221" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1221"
    to              = "vlan-1221"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1222]-to-[vlan-1222]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1222" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1222"
    to              = "vlan-1222"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1223]-to-[vlan-1223]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1223" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1223"
    to              = "vlan-1223"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1224]-to-[vlan-1224]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1224" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1224"
    to              = "vlan-1224"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1225]-to-[vlan-1225]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1225" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1225"
    to              = "vlan-1225"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1226]-to-[vlan-1226]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1226" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1226"
    to              = "vlan-1226"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1227]-to-[vlan-1227]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1227" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1227"
    to              = "vlan-1227"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1228]-to-[vlan-1228]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1228" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1228"
    to              = "vlan-1228"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1229]-to-[vlan-1229]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1229" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1229"
    to              = "vlan-1229"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1230]-to-[vlan-1230]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1230" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1230"
    to              = "vlan-1230"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1231]-to-[vlan-1231]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1231" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1231"
    to              = "vlan-1231"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1232]-to-[vlan-1232]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1232" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1232"
    to              = "vlan-1232"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1233]-to-[vlan-1233]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1233" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1233"
    to              = "vlan-1233"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1234]-to-[vlan-1234]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1234" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1234"
    to              = "vlan-1234"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1235]-to-[vlan-1235]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1235" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1235"
    to              = "vlan-1235"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1236]-to-[vlan-1236]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1236" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1236"
    to              = "vlan-1236"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1237]-to-[vlan-1237]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1237" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1237"
    to              = "vlan-1237"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1238]-to-[vlan-1238]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1238" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1238"
    to              = "vlan-1238"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1239]-to-[vlan-1239]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1239" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1239"
    to              = "vlan-1239"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1240]-to-[vlan-1240]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1240" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1240"
    to              = "vlan-1240"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1241]-to-[vlan-1241]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1241" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1241"
    to              = "vlan-1241"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1242]-to-[vlan-1242]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1242" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1242"
    to              = "vlan-1242"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1243]-to-[vlan-1243]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1243" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1243"
    to              = "vlan-1243"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1244]-to-[vlan-1244]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1244" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1244"
    to              = "vlan-1244"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1245]-to-[vlan-1245]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1245" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1245"
    to              = "vlan-1245"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1246]-to-[vlan-1246]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1246" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1246"
    to              = "vlan-1246"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1247]-to-[vlan-1247]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1247" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1247"
    to              = "vlan-1247"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1248]-to-[vlan-1248]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1248" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1248"
    to              = "vlan-1248"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1249]-to-[vlan-1249]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1249" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1249"
    to              = "vlan-1249"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1250]-to-[vlan-1250]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1250" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1250"
    to              = "vlan-1250"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1251]-to-[vlan-1251]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1251" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1251"
    to              = "vlan-1251"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1252]-to-[vlan-1252]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1252" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1252"
    to              = "vlan-1252"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1253]-to-[vlan-1253]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1253" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1253"
    to              = "vlan-1253"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1254]-to-[vlan-1254]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1254" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1254"
    to              = "vlan-1254"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1255]-to-[vlan-1255]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1255" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1255"
    to              = "vlan-1255"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1256]-to-[vlan-1256]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1256" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1256"
    to              = "vlan-1256"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1257]-to-[vlan-1257]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1257" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1257"
    to              = "vlan-1257"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1258]-to-[vlan-1258]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1258" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1258"
    to              = "vlan-1258"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1259]-to-[vlan-1259]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1259" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1259"
    to              = "vlan-1259"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1260]-to-[vlan-1260]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1260" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1260"
    to              = "vlan-1260"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1261]-to-[vlan-1261]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1261" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1261"
    to              = "vlan-1261"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1262]-to-[vlan-1262]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1262" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1262"
    to              = "vlan-1262"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1263]-to-[vlan-1263]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1263" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1263"
    to              = "vlan-1263"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1264]-to-[vlan-1264]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1264" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1264"
    to              = "vlan-1264"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1265]-to-[vlan-1265]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1265" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1265"
    to              = "vlan-1265"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1266]-to-[vlan-1266]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1266" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1266"
    to              = "vlan-1266"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1267]-to-[vlan-1267]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1267" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1267"
    to              = "vlan-1267"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1268]-to-[vlan-1268]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1268" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1268"
    to              = "vlan-1268"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1269]-to-[vlan-1269]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1269" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1269"
    to              = "vlan-1269"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1270]-to-[vlan-1270]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1270" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1270"
    to              = "vlan-1270"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1271]-to-[vlan-1271]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1271" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1271"
    to              = "vlan-1271"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1272]-to-[vlan-1272]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1272" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1272"
    to              = "vlan-1272"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1273]-to-[vlan-1273]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1273" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1273"
    to              = "vlan-1273"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1274]-to-[vlan-1274]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1274" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1274"
    to              = "vlan-1274"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1275]-to-[vlan-1275]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1275" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1275"
    to              = "vlan-1275"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1276]-to-[vlan-1276]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1276" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1276"
    to              = "vlan-1276"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1277]-to-[vlan-1277]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1277" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1277"
    to              = "vlan-1277"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1278]-to-[vlan-1278]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1278" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1278"
    to              = "vlan-1278"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1279]-to-[vlan-1279]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1279" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1279"
    to              = "vlan-1279"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1280]-to-[vlan-1280]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1280" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1280"
    to              = "vlan-1280"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1281]-to-[vlan-1281]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1281" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1281"
    to              = "vlan-1281"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1282]-to-[vlan-1282]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1282" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1282"
    to              = "vlan-1282"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1283]-to-[vlan-1283]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1283" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1283"
    to              = "vlan-1283"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1284]-to-[vlan-1284]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1284" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1284"
    to              = "vlan-1284"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1285]-to-[vlan-1285]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1285" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1285"
    to              = "vlan-1285"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1286]-to-[vlan-1286]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1286" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1286"
    to              = "vlan-1286"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1287]-to-[vlan-1287]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1287" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1287"
    to              = "vlan-1287"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1288]-to-[vlan-1288]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1288" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1288"
    to              = "vlan-1288"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1289]-to-[vlan-1289]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1289" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1289"
    to              = "vlan-1289"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1290]-to-[vlan-1290]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1290" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1290"
    to              = "vlan-1290"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1291]-to-[vlan-1291]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1291" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1291"
    to              = "vlan-1291"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1292]-to-[vlan-1292]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1292" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1292"
    to              = "vlan-1292"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1293]-to-[vlan-1293]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1293" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1293"
    to              = "vlan-1293"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1294]-to-[vlan-1294]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1294" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1294"
    to              = "vlan-1294"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1295]-to-[vlan-1295]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1295" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1295"
    to              = "vlan-1295"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1296]-to-[vlan-1296]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1296" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1296"
    to              = "vlan-1296"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1297]-to-[vlan-1297]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1297" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1297"
    to              = "vlan-1297"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1298]-to-[vlan-1298]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1298" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1298"
    to              = "vlan-1298"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-1299]-to-[vlan-1299]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_1299" {
    depends_on      = [
        data.aci_vlan_pool.vlan_pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-1299"
    to              = "vlan-1299"
}

