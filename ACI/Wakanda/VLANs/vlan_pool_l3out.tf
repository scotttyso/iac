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
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2000]-to-[vlan-2000]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2000" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2000"
    to              = "vlan-2000"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2001]-to-[vlan-2001]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2001" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2001"
    to              = "vlan-2001"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2002]-to-[vlan-2002]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2002" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2002"
    to              = "vlan-2002"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2003]-to-[vlan-2003]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2003" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2003"
    to              = "vlan-2003"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2004]-to-[vlan-2004]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2004" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2004"
    to              = "vlan-2004"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2005]-to-[vlan-2005]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2005" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2005"
    to              = "vlan-2005"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2006]-to-[vlan-2006]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2006" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2006"
    to              = "vlan-2006"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2007]-to-[vlan-2007]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2007" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2007"
    to              = "vlan-2007"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2008]-to-[vlan-2008]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2008" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2008"
    to              = "vlan-2008"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2009]-to-[vlan-2009]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2009" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2009"
    to              = "vlan-2009"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2010]-to-[vlan-2010]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2010" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2010"
    to              = "vlan-2010"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2011]-to-[vlan-2011]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2011" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2011"
    to              = "vlan-2011"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2012]-to-[vlan-2012]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2012" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2012"
    to              = "vlan-2012"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2013]-to-[vlan-2013]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2013" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2013"
    to              = "vlan-2013"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2014]-to-[vlan-2014]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2014" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2014"
    to              = "vlan-2014"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2015]-to-[vlan-2015]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2015" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2015"
    to              = "vlan-2015"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2016]-to-[vlan-2016]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2016" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2016"
    to              = "vlan-2016"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2017]-to-[vlan-2017]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2017" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2017"
    to              = "vlan-2017"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2018]-to-[vlan-2018]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2018" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2018"
    to              = "vlan-2018"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2019]-to-[vlan-2019]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2019" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2019"
    to              = "vlan-2019"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2020]-to-[vlan-2020]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2020" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2020"
    to              = "vlan-2020"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2021]-to-[vlan-2021]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2021" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2021"
    to              = "vlan-2021"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2022]-to-[vlan-2022]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2022" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2022"
    to              = "vlan-2022"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2023]-to-[vlan-2023]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2023" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2023"
    to              = "vlan-2023"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2024]-to-[vlan-2024]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2024" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2024"
    to              = "vlan-2024"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2025]-to-[vlan-2025]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2025" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2025"
    to              = "vlan-2025"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2026]-to-[vlan-2026]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2026" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2026"
    to              = "vlan-2026"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2027]-to-[vlan-2027]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2027" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2027"
    to              = "vlan-2027"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2028]-to-[vlan-2028]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2028" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2028"
    to              = "vlan-2028"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2029]-to-[vlan-2029]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2029" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2029"
    to              = "vlan-2029"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2030]-to-[vlan-2030]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2030" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2030"
    to              = "vlan-2030"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2031]-to-[vlan-2031]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2031" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2031"
    to              = "vlan-2031"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2032]-to-[vlan-2032]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2032" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2032"
    to              = "vlan-2032"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2033]-to-[vlan-2033]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2033" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2033"
    to              = "vlan-2033"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2034]-to-[vlan-2034]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2034" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2034"
    to              = "vlan-2034"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2035]-to-[vlan-2035]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2035" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2035"
    to              = "vlan-2035"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2036]-to-[vlan-2036]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2036" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2036"
    to              = "vlan-2036"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2037]-to-[vlan-2037]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2037" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2037"
    to              = "vlan-2037"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2038]-to-[vlan-2038]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2038" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2038"
    to              = "vlan-2038"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2039]-to-[vlan-2039]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2039" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2039"
    to              = "vlan-2039"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2040]-to-[vlan-2040]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2040" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2040"
    to              = "vlan-2040"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2041]-to-[vlan-2041]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2041" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2041"
    to              = "vlan-2041"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2042]-to-[vlan-2042]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2042" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2042"
    to              = "vlan-2042"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2043]-to-[vlan-2043]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2043" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2043"
    to              = "vlan-2043"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2044]-to-[vlan-2044]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2044" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2044"
    to              = "vlan-2044"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2045]-to-[vlan-2045]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2045" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2045"
    to              = "vlan-2045"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2046]-to-[vlan-2046]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2046" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2046"
    to              = "vlan-2046"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2047]-to-[vlan-2047]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2047" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2047"
    to              = "vlan-2047"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2048]-to-[vlan-2048]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2048" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2048"
    to              = "vlan-2048"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2049]-to-[vlan-2049]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2049" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2049"
    to              = "vlan-2049"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2050]-to-[vlan-2050]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2050" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2050"
    to              = "vlan-2050"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2051]-to-[vlan-2051]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2051" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2051"
    to              = "vlan-2051"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2052]-to-[vlan-2052]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2052" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2052"
    to              = "vlan-2052"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2053]-to-[vlan-2053]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2053" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2053"
    to              = "vlan-2053"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2054]-to-[vlan-2054]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2054" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2054"
    to              = "vlan-2054"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2055]-to-[vlan-2055]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2055" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2055"
    to              = "vlan-2055"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2056]-to-[vlan-2056]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2056" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2056"
    to              = "vlan-2056"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2057]-to-[vlan-2057]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2057" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2057"
    to              = "vlan-2057"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2058]-to-[vlan-2058]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2058" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2058"
    to              = "vlan-2058"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2059]-to-[vlan-2059]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2059" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2059"
    to              = "vlan-2059"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2060]-to-[vlan-2060]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2060" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2060"
    to              = "vlan-2060"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2061]-to-[vlan-2061]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2061" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2061"
    to              = "vlan-2061"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2062]-to-[vlan-2062]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2062" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2062"
    to              = "vlan-2062"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2063]-to-[vlan-2063]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2063" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2063"
    to              = "vlan-2063"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2064]-to-[vlan-2064]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2064" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2064"
    to              = "vlan-2064"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2065]-to-[vlan-2065]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2065" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2065"
    to              = "vlan-2065"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2066]-to-[vlan-2066]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2066" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2066"
    to              = "vlan-2066"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2067]-to-[vlan-2067]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2067" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2067"
    to              = "vlan-2067"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2068]-to-[vlan-2068]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2068" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2068"
    to              = "vlan-2068"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2069]-to-[vlan-2069]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2069" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2069"
    to              = "vlan-2069"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2070]-to-[vlan-2070]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2070" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2070"
    to              = "vlan-2070"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2071]-to-[vlan-2071]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2071" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2071"
    to              = "vlan-2071"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2072]-to-[vlan-2072]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2072" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2072"
    to              = "vlan-2072"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2073]-to-[vlan-2073]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2073" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2073"
    to              = "vlan-2073"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2074]-to-[vlan-2074]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2074" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2074"
    to              = "vlan-2074"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2075]-to-[vlan-2075]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2075" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2075"
    to              = "vlan-2075"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2076]-to-[vlan-2076]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2076" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2076"
    to              = "vlan-2076"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2077]-to-[vlan-2077]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2077" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2077"
    to              = "vlan-2077"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2078]-to-[vlan-2078]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2078" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2078"
    to              = "vlan-2078"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2079]-to-[vlan-2079]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2079" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2079"
    to              = "vlan-2079"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2080]-to-[vlan-2080]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2080" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2080"
    to              = "vlan-2080"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2081]-to-[vlan-2081]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2081" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2081"
    to              = "vlan-2081"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2082]-to-[vlan-2082]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2082" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2082"
    to              = "vlan-2082"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2083]-to-[vlan-2083]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2083" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2083"
    to              = "vlan-2083"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2084]-to-[vlan-2084]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2084" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2084"
    to              = "vlan-2084"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2085]-to-[vlan-2085]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2085" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2085"
    to              = "vlan-2085"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2086]-to-[vlan-2086]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2086" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2086"
    to              = "vlan-2086"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2087]-to-[vlan-2087]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2087" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2087"
    to              = "vlan-2087"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2088]-to-[vlan-2088]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2088" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2088"
    to              = "vlan-2088"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2089]-to-[vlan-2089]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2089" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2089"
    to              = "vlan-2089"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2090]-to-[vlan-2090]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2090" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2090"
    to              = "vlan-2090"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2091]-to-[vlan-2091]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2091" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2091"
    to              = "vlan-2091"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2092]-to-[vlan-2092]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2092" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2092"
    to              = "vlan-2092"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2093]-to-[vlan-2093]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2093" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2093"
    to              = "vlan-2093"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2094]-to-[vlan-2094]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2094" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2094"
    to              = "vlan-2094"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2095]-to-[vlan-2095]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2095" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2095"
    to              = "vlan-2095"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2096]-to-[vlan-2096]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2096" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2096"
    to              = "vlan-2096"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2097]-to-[vlan-2097]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2097" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2097"
    to              = "vlan-2097"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2098]-to-[vlan-2098]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2098" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2098"
    to              = "vlan-2098"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[l3out]-static/from-[vlan-2099]-to-[vlan-2099]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[l3out] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_l3out_2099" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_l3out
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_l3out.id
    from            = "vlan-2099"
    to              = "vlan-2099"
}

