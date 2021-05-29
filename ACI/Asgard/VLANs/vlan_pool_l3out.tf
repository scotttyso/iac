/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-4]-to-[vlan-4]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_4" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-4"
    to              = "vlan-4"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1000]-to-[vlan-1000]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1000" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1000"
    to              = "vlan-1000"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1001]-to-[vlan-1001]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1001" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1001"
    to              = "vlan-1001"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1002]-to-[vlan-1002]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1002" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1002"
    to              = "vlan-1002"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1003]-to-[vlan-1003]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1003" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1003"
    to              = "vlan-1003"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1004]-to-[vlan-1004]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1004" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1004"
    to              = "vlan-1004"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1005]-to-[vlan-1005]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1005" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1005"
    to              = "vlan-1005"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1006]-to-[vlan-1006]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1006" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1006"
    to              = "vlan-1006"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1007]-to-[vlan-1007]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1007" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1007"
    to              = "vlan-1007"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1008]-to-[vlan-1008]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1008" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1008"
    to              = "vlan-1008"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1009]-to-[vlan-1009]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1009" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1009"
    to              = "vlan-1009"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1010]-to-[vlan-1010]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1010" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1010"
    to              = "vlan-1010"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1011]-to-[vlan-1011]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1011" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1011"
    to              = "vlan-1011"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1012]-to-[vlan-1012]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1012" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1012"
    to              = "vlan-1012"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1013]-to-[vlan-1013]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1013" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1013"
    to              = "vlan-1013"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1014]-to-[vlan-1014]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1014" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1014"
    to              = "vlan-1014"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1015]-to-[vlan-1015]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1015" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1015"
    to              = "vlan-1015"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1016]-to-[vlan-1016]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1016" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1016"
    to              = "vlan-1016"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1017]-to-[vlan-1017]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1017" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1017"
    to              = "vlan-1017"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1018]-to-[vlan-1018]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1018" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1018"
    to              = "vlan-1018"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1019]-to-[vlan-1019]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1019" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1019"
    to              = "vlan-1019"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1020]-to-[vlan-1020]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1020" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1020"
    to              = "vlan-1020"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1021]-to-[vlan-1021]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1021" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1021"
    to              = "vlan-1021"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1022]-to-[vlan-1022]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1022" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1022"
    to              = "vlan-1022"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1023]-to-[vlan-1023]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1023" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1023"
    to              = "vlan-1023"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1024]-to-[vlan-1024]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1024" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1024"
    to              = "vlan-1024"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1025]-to-[vlan-1025]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1025" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1025"
    to              = "vlan-1025"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1026]-to-[vlan-1026]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1026" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1026"
    to              = "vlan-1026"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1027]-to-[vlan-1027]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1027" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1027"
    to              = "vlan-1027"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1028]-to-[vlan-1028]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1028" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1028"
    to              = "vlan-1028"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1029]-to-[vlan-1029]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1029" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1029"
    to              = "vlan-1029"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1030]-to-[vlan-1030]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1030" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1030"
    to              = "vlan-1030"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1031]-to-[vlan-1031]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1031" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1031"
    to              = "vlan-1031"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1032]-to-[vlan-1032]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1032" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1032"
    to              = "vlan-1032"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1033]-to-[vlan-1033]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1033" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1033"
    to              = "vlan-1033"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1034]-to-[vlan-1034]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1034" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1034"
    to              = "vlan-1034"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1035]-to-[vlan-1035]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1035" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1035"
    to              = "vlan-1035"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1036]-to-[vlan-1036]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1036" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1036"
    to              = "vlan-1036"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1037]-to-[vlan-1037]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1037" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1037"
    to              = "vlan-1037"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1038]-to-[vlan-1038]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1038" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1038"
    to              = "vlan-1038"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1039]-to-[vlan-1039]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1039" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1039"
    to              = "vlan-1039"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1040]-to-[vlan-1040]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1040" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1040"
    to              = "vlan-1040"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1041]-to-[vlan-1041]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1041" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1041"
    to              = "vlan-1041"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1042]-to-[vlan-1042]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1042" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1042"
    to              = "vlan-1042"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1043]-to-[vlan-1043]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1043" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1043"
    to              = "vlan-1043"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1044]-to-[vlan-1044]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1044" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1044"
    to              = "vlan-1044"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1045]-to-[vlan-1045]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1045" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1045"
    to              = "vlan-1045"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1046]-to-[vlan-1046]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1046" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1046"
    to              = "vlan-1046"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1047]-to-[vlan-1047]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1047" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1047"
    to              = "vlan-1047"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1048]-to-[vlan-1048]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1048" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1048"
    to              = "vlan-1048"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1049]-to-[vlan-1049]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1049" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1049"
    to              = "vlan-1049"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1050]-to-[vlan-1050]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1050" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1050"
    to              = "vlan-1050"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1051]-to-[vlan-1051]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1051" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1051"
    to              = "vlan-1051"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1052]-to-[vlan-1052]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1052" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1052"
    to              = "vlan-1052"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1053]-to-[vlan-1053]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1053" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1053"
    to              = "vlan-1053"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1054]-to-[vlan-1054]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1054" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1054"
    to              = "vlan-1054"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1055]-to-[vlan-1055]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1055" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1055"
    to              = "vlan-1055"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1056]-to-[vlan-1056]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1056" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1056"
    to              = "vlan-1056"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1057]-to-[vlan-1057]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1057" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1057"
    to              = "vlan-1057"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1058]-to-[vlan-1058]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1058" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1058"
    to              = "vlan-1058"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1059]-to-[vlan-1059]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1059" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1059"
    to              = "vlan-1059"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1060]-to-[vlan-1060]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1060" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1060"
    to              = "vlan-1060"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1061]-to-[vlan-1061]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1061" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1061"
    to              = "vlan-1061"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1062]-to-[vlan-1062]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1062" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1062"
    to              = "vlan-1062"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1063]-to-[vlan-1063]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1063" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1063"
    to              = "vlan-1063"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1064]-to-[vlan-1064]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1064" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1064"
    to              = "vlan-1064"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1065]-to-[vlan-1065]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1065" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1065"
    to              = "vlan-1065"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1066]-to-[vlan-1066]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1066" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1066"
    to              = "vlan-1066"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1067]-to-[vlan-1067]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1067" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1067"
    to              = "vlan-1067"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1068]-to-[vlan-1068]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1068" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1068"
    to              = "vlan-1068"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1069]-to-[vlan-1069]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1069" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1069"
    to              = "vlan-1069"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1070]-to-[vlan-1070]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1070" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1070"
    to              = "vlan-1070"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1071]-to-[vlan-1071]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1071" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1071"
    to              = "vlan-1071"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1072]-to-[vlan-1072]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1072" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1072"
    to              = "vlan-1072"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1073]-to-[vlan-1073]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1073" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1073"
    to              = "vlan-1073"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1074]-to-[vlan-1074]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1074" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1074"
    to              = "vlan-1074"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1075]-to-[vlan-1075]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1075" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1075"
    to              = "vlan-1075"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1076]-to-[vlan-1076]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1076" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1076"
    to              = "vlan-1076"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1077]-to-[vlan-1077]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1077" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1077"
    to              = "vlan-1077"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1078]-to-[vlan-1078]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1078" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1078"
    to              = "vlan-1078"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1079]-to-[vlan-1079]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1079" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1079"
    to              = "vlan-1079"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1080]-to-[vlan-1080]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1080" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1080"
    to              = "vlan-1080"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1081]-to-[vlan-1081]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1081" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1081"
    to              = "vlan-1081"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1082]-to-[vlan-1082]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1082" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1082"
    to              = "vlan-1082"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1083]-to-[vlan-1083]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1083" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1083"
    to              = "vlan-1083"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1084]-to-[vlan-1084]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1084" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1084"
    to              = "vlan-1084"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1085]-to-[vlan-1085]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1085" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1085"
    to              = "vlan-1085"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1086]-to-[vlan-1086]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1086" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1086"
    to              = "vlan-1086"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1087]-to-[vlan-1087]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1087" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1087"
    to              = "vlan-1087"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1088]-to-[vlan-1088]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1088" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1088"
    to              = "vlan-1088"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1089]-to-[vlan-1089]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1089" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1089"
    to              = "vlan-1089"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1090]-to-[vlan-1090]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1090" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1090"
    to              = "vlan-1090"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1091]-to-[vlan-1091]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1091" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1091"
    to              = "vlan-1091"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1092]-to-[vlan-1092]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1092" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1092"
    to              = "vlan-1092"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1093]-to-[vlan-1093]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1093" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1093"
    to              = "vlan-1093"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1094]-to-[vlan-1094]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1094" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1094"
    to              = "vlan-1094"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1095]-to-[vlan-1095]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1095" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1095"
    to              = "vlan-1095"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1096]-to-[vlan-1096]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1096" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1096"
    to              = "vlan-1096"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1097]-to-[vlan-1097]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1097" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1097"
    to              = "vlan-1097"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1098]-to-[vlan-1098]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1098" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1098"
    to              = "vlan-1098"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-1099]-to-[vlan-1099]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_1099" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-1099"
    to              = "vlan-1099"
}

