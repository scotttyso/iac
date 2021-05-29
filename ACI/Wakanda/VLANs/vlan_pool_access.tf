/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2100]-to-[vlan-2100]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2100" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2100"
    to              = "vlan-2100"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2101]-to-[vlan-2101]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2101" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2101"
    to              = "vlan-2101"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2102]-to-[vlan-2102]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2102" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2102"
    to              = "vlan-2102"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2103]-to-[vlan-2103]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2103" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2103"
    to              = "vlan-2103"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2104]-to-[vlan-2104]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2104" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2104"
    to              = "vlan-2104"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2105]-to-[vlan-2105]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2105" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2105"
    to              = "vlan-2105"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2106]-to-[vlan-2106]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2106" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2106"
    to              = "vlan-2106"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2107]-to-[vlan-2107]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2107" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2107"
    to              = "vlan-2107"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2108]-to-[vlan-2108]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2108" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2108"
    to              = "vlan-2108"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2109]-to-[vlan-2109]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2109" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2109"
    to              = "vlan-2109"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2110]-to-[vlan-2110]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2110" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2110"
    to              = "vlan-2110"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2111]-to-[vlan-2111]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2111" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2111"
    to              = "vlan-2111"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2112]-to-[vlan-2112]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2112" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2112"
    to              = "vlan-2112"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2113]-to-[vlan-2113]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2113" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2113"
    to              = "vlan-2113"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2114]-to-[vlan-2114]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2114" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2114"
    to              = "vlan-2114"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2115]-to-[vlan-2115]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2115" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2115"
    to              = "vlan-2115"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2116]-to-[vlan-2116]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2116" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2116"
    to              = "vlan-2116"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2117]-to-[vlan-2117]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2117" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2117"
    to              = "vlan-2117"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2118]-to-[vlan-2118]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2118" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2118"
    to              = "vlan-2118"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2119]-to-[vlan-2119]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2119" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2119"
    to              = "vlan-2119"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2120]-to-[vlan-2120]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2120" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2120"
    to              = "vlan-2120"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2121]-to-[vlan-2121]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2121" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2121"
    to              = "vlan-2121"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2122]-to-[vlan-2122]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2122" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2122"
    to              = "vlan-2122"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2123]-to-[vlan-2123]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2123" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2123"
    to              = "vlan-2123"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2124]-to-[vlan-2124]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2124" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2124"
    to              = "vlan-2124"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2125]-to-[vlan-2125]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2125" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2125"
    to              = "vlan-2125"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2126]-to-[vlan-2126]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2126" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2126"
    to              = "vlan-2126"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2127]-to-[vlan-2127]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2127" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2127"
    to              = "vlan-2127"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2128]-to-[vlan-2128]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2128" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2128"
    to              = "vlan-2128"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2129]-to-[vlan-2129]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2129" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2129"
    to              = "vlan-2129"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2130]-to-[vlan-2130]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2130" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2130"
    to              = "vlan-2130"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2131]-to-[vlan-2131]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2131" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2131"
    to              = "vlan-2131"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2132]-to-[vlan-2132]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2132" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2132"
    to              = "vlan-2132"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2133]-to-[vlan-2133]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2133" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2133"
    to              = "vlan-2133"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2134]-to-[vlan-2134]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2134" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2134"
    to              = "vlan-2134"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2135]-to-[vlan-2135]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2135" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2135"
    to              = "vlan-2135"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2136]-to-[vlan-2136]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2136" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2136"
    to              = "vlan-2136"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2137]-to-[vlan-2137]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2137" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2137"
    to              = "vlan-2137"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2138]-to-[vlan-2138]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2138" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2138"
    to              = "vlan-2138"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2139]-to-[vlan-2139]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2139" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2139"
    to              = "vlan-2139"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2140]-to-[vlan-2140]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2140" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2140"
    to              = "vlan-2140"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2141]-to-[vlan-2141]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2141" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2141"
    to              = "vlan-2141"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2142]-to-[vlan-2142]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2142" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2142"
    to              = "vlan-2142"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2143]-to-[vlan-2143]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2143" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2143"
    to              = "vlan-2143"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2144]-to-[vlan-2144]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2144" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2144"
    to              = "vlan-2144"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2145]-to-[vlan-2145]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2145" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2145"
    to              = "vlan-2145"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2146]-to-[vlan-2146]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2146" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2146"
    to              = "vlan-2146"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2147]-to-[vlan-2147]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2147" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2147"
    to              = "vlan-2147"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2148]-to-[vlan-2148]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2148" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2148"
    to              = "vlan-2148"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2149]-to-[vlan-2149]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2149" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2149"
    to              = "vlan-2149"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2150]-to-[vlan-2150]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2150" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2150"
    to              = "vlan-2150"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2151]-to-[vlan-2151]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2151" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2151"
    to              = "vlan-2151"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2152]-to-[vlan-2152]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2152" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2152"
    to              = "vlan-2152"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2153]-to-[vlan-2153]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2153" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2153"
    to              = "vlan-2153"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2154]-to-[vlan-2154]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2154" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2154"
    to              = "vlan-2154"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2155]-to-[vlan-2155]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2155" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2155"
    to              = "vlan-2155"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2156]-to-[vlan-2156]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2156" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2156"
    to              = "vlan-2156"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2157]-to-[vlan-2157]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2157" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2157"
    to              = "vlan-2157"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2158]-to-[vlan-2158]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2158" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2158"
    to              = "vlan-2158"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2159]-to-[vlan-2159]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2159" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2159"
    to              = "vlan-2159"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2160]-to-[vlan-2160]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2160" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2160"
    to              = "vlan-2160"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2161]-to-[vlan-2161]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2161" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2161"
    to              = "vlan-2161"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2162]-to-[vlan-2162]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2162" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2162"
    to              = "vlan-2162"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2163]-to-[vlan-2163]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2163" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2163"
    to              = "vlan-2163"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2164]-to-[vlan-2164]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2164" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2164"
    to              = "vlan-2164"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2165]-to-[vlan-2165]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2165" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2165"
    to              = "vlan-2165"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2166]-to-[vlan-2166]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2166" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2166"
    to              = "vlan-2166"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2167]-to-[vlan-2167]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2167" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2167"
    to              = "vlan-2167"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2168]-to-[vlan-2168]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2168" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2168"
    to              = "vlan-2168"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2169]-to-[vlan-2169]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2169" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2169"
    to              = "vlan-2169"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2170]-to-[vlan-2170]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2170" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2170"
    to              = "vlan-2170"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2171]-to-[vlan-2171]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2171" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2171"
    to              = "vlan-2171"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2172]-to-[vlan-2172]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2172" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2172"
    to              = "vlan-2172"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2173]-to-[vlan-2173]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2173" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2173"
    to              = "vlan-2173"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2174]-to-[vlan-2174]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2174" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2174"
    to              = "vlan-2174"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2175]-to-[vlan-2175]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2175" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2175"
    to              = "vlan-2175"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2176]-to-[vlan-2176]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2176" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2176"
    to              = "vlan-2176"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2177]-to-[vlan-2177]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2177" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2177"
    to              = "vlan-2177"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2178]-to-[vlan-2178]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2178" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2178"
    to              = "vlan-2178"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2179]-to-[vlan-2179]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2179" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2179"
    to              = "vlan-2179"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2180]-to-[vlan-2180]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2180" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2180"
    to              = "vlan-2180"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2181]-to-[vlan-2181]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2181" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2181"
    to              = "vlan-2181"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2182]-to-[vlan-2182]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2182" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2182"
    to              = "vlan-2182"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2183]-to-[vlan-2183]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2183" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2183"
    to              = "vlan-2183"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2184]-to-[vlan-2184]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2184" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2184"
    to              = "vlan-2184"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2185]-to-[vlan-2185]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2185" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2185"
    to              = "vlan-2185"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2186]-to-[vlan-2186]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2186" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2186"
    to              = "vlan-2186"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2187]-to-[vlan-2187]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2187" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2187"
    to              = "vlan-2187"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2188]-to-[vlan-2188]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2188" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2188"
    to              = "vlan-2188"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2189]-to-[vlan-2189]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2189" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2189"
    to              = "vlan-2189"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2190]-to-[vlan-2190]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2190" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2190"
    to              = "vlan-2190"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2191]-to-[vlan-2191]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2191" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2191"
    to              = "vlan-2191"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2192]-to-[vlan-2192]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2192" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2192"
    to              = "vlan-2192"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2193]-to-[vlan-2193]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2193" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2193"
    to              = "vlan-2193"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2194]-to-[vlan-2194]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2194" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2194"
    to              = "vlan-2194"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2195]-to-[vlan-2195]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2195" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2195"
    to              = "vlan-2195"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2196]-to-[vlan-2196]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2196" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2196"
    to              = "vlan-2196"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2197]-to-[vlan-2197]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2197" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2197"
    to              = "vlan-2197"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2198]-to-[vlan-2198]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2198" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2198"
    to              = "vlan-2198"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2199]-to-[vlan-2199]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2199" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2199"
    to              = "vlan-2199"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2200]-to-[vlan-2200]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2200" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2200"
    to              = "vlan-2200"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2201]-to-[vlan-2201]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2201" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2201"
    to              = "vlan-2201"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2202]-to-[vlan-2202]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2202" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2202"
    to              = "vlan-2202"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2203]-to-[vlan-2203]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2203" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2203"
    to              = "vlan-2203"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2204]-to-[vlan-2204]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2204" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2204"
    to              = "vlan-2204"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2205]-to-[vlan-2205]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2205" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2205"
    to              = "vlan-2205"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2206]-to-[vlan-2206]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2206" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2206"
    to              = "vlan-2206"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2207]-to-[vlan-2207]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2207" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2207"
    to              = "vlan-2207"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2208]-to-[vlan-2208]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2208" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2208"
    to              = "vlan-2208"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2209]-to-[vlan-2209]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2209" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2209"
    to              = "vlan-2209"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2210]-to-[vlan-2210]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2210" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2210"
    to              = "vlan-2210"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2211]-to-[vlan-2211]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2211" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2211"
    to              = "vlan-2211"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2212]-to-[vlan-2212]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2212" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2212"
    to              = "vlan-2212"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2213]-to-[vlan-2213]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2213" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2213"
    to              = "vlan-2213"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2214]-to-[vlan-2214]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2214" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2214"
    to              = "vlan-2214"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2215]-to-[vlan-2215]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2215" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2215"
    to              = "vlan-2215"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2216]-to-[vlan-2216]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2216" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2216"
    to              = "vlan-2216"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2217]-to-[vlan-2217]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2217" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2217"
    to              = "vlan-2217"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2218]-to-[vlan-2218]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2218" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2218"
    to              = "vlan-2218"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2219]-to-[vlan-2219]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2219" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2219"
    to              = "vlan-2219"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2220]-to-[vlan-2220]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2220" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2220"
    to              = "vlan-2220"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2221]-to-[vlan-2221]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2221" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2221"
    to              = "vlan-2221"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2222]-to-[vlan-2222]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2222" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2222"
    to              = "vlan-2222"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2223]-to-[vlan-2223]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2223" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2223"
    to              = "vlan-2223"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2224]-to-[vlan-2224]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2224" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2224"
    to              = "vlan-2224"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2225]-to-[vlan-2225]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2225" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2225"
    to              = "vlan-2225"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2226]-to-[vlan-2226]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2226" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2226"
    to              = "vlan-2226"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2227]-to-[vlan-2227]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2227" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2227"
    to              = "vlan-2227"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2228]-to-[vlan-2228]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2228" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2228"
    to              = "vlan-2228"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2229]-to-[vlan-2229]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2229" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2229"
    to              = "vlan-2229"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2230]-to-[vlan-2230]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2230" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2230"
    to              = "vlan-2230"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2231]-to-[vlan-2231]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2231" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2231"
    to              = "vlan-2231"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2232]-to-[vlan-2232]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2232" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2232"
    to              = "vlan-2232"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2233]-to-[vlan-2233]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2233" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2233"
    to              = "vlan-2233"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2234]-to-[vlan-2234]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2234" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2234"
    to              = "vlan-2234"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2235]-to-[vlan-2235]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2235" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2235"
    to              = "vlan-2235"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2236]-to-[vlan-2236]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2236" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2236"
    to              = "vlan-2236"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2237]-to-[vlan-2237]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2237" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2237"
    to              = "vlan-2237"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2238]-to-[vlan-2238]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2238" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2238"
    to              = "vlan-2238"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2239]-to-[vlan-2239]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2239" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2239"
    to              = "vlan-2239"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2240]-to-[vlan-2240]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2240" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2240"
    to              = "vlan-2240"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2241]-to-[vlan-2241]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2241" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2241"
    to              = "vlan-2241"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2242]-to-[vlan-2242]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2242" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2242"
    to              = "vlan-2242"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2243]-to-[vlan-2243]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2243" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2243"
    to              = "vlan-2243"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2244]-to-[vlan-2244]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2244" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2244"
    to              = "vlan-2244"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2245]-to-[vlan-2245]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2245" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2245"
    to              = "vlan-2245"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2246]-to-[vlan-2246]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2246" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2246"
    to              = "vlan-2246"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2247]-to-[vlan-2247]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2247" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2247"
    to              = "vlan-2247"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2248]-to-[vlan-2248]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2248" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2248"
    to              = "vlan-2248"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2249]-to-[vlan-2249]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2249" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2249"
    to              = "vlan-2249"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2250]-to-[vlan-2250]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2250" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2250"
    to              = "vlan-2250"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2251]-to-[vlan-2251]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2251" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2251"
    to              = "vlan-2251"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2252]-to-[vlan-2252]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2252" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2252"
    to              = "vlan-2252"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2253]-to-[vlan-2253]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2253" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2253"
    to              = "vlan-2253"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2254]-to-[vlan-2254]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2254" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2254"
    to              = "vlan-2254"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2255]-to-[vlan-2255]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2255" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2255"
    to              = "vlan-2255"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2256]-to-[vlan-2256]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2256" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2256"
    to              = "vlan-2256"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2257]-to-[vlan-2257]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2257" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2257"
    to              = "vlan-2257"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2258]-to-[vlan-2258]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2258" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2258"
    to              = "vlan-2258"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2259]-to-[vlan-2259]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2259" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2259"
    to              = "vlan-2259"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2260]-to-[vlan-2260]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2260" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2260"
    to              = "vlan-2260"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2261]-to-[vlan-2261]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2261" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2261"
    to              = "vlan-2261"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2262]-to-[vlan-2262]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2262" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2262"
    to              = "vlan-2262"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2263]-to-[vlan-2263]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2263" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2263"
    to              = "vlan-2263"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2264]-to-[vlan-2264]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2264" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2264"
    to              = "vlan-2264"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2265]-to-[vlan-2265]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2265" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2265"
    to              = "vlan-2265"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2266]-to-[vlan-2266]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2266" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2266"
    to              = "vlan-2266"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2267]-to-[vlan-2267]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2267" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2267"
    to              = "vlan-2267"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2268]-to-[vlan-2268]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2268" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2268"
    to              = "vlan-2268"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2269]-to-[vlan-2269]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2269" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2269"
    to              = "vlan-2269"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2270]-to-[vlan-2270]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2270" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2270"
    to              = "vlan-2270"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2271]-to-[vlan-2271]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2271" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2271"
    to              = "vlan-2271"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2272]-to-[vlan-2272]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2272" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2272"
    to              = "vlan-2272"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2273]-to-[vlan-2273]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2273" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2273"
    to              = "vlan-2273"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2274]-to-[vlan-2274]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2274" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2274"
    to              = "vlan-2274"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2275]-to-[vlan-2275]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2275" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2275"
    to              = "vlan-2275"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2276]-to-[vlan-2276]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2276" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2276"
    to              = "vlan-2276"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2277]-to-[vlan-2277]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2277" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2277"
    to              = "vlan-2277"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2278]-to-[vlan-2278]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2278" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2278"
    to              = "vlan-2278"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2279]-to-[vlan-2279]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2279" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2279"
    to              = "vlan-2279"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2280]-to-[vlan-2280]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2280" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2280"
    to              = "vlan-2280"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2281]-to-[vlan-2281]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2281" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2281"
    to              = "vlan-2281"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2282]-to-[vlan-2282]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2282" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2282"
    to              = "vlan-2282"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2283]-to-[vlan-2283]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2283" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2283"
    to              = "vlan-2283"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2284]-to-[vlan-2284]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2284" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2284"
    to              = "vlan-2284"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2285]-to-[vlan-2285]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2285" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2285"
    to              = "vlan-2285"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2286]-to-[vlan-2286]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2286" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2286"
    to              = "vlan-2286"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2287]-to-[vlan-2287]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2287" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2287"
    to              = "vlan-2287"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2288]-to-[vlan-2288]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2288" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2288"
    to              = "vlan-2288"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2289]-to-[vlan-2289]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2289" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2289"
    to              = "vlan-2289"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2290]-to-[vlan-2290]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2290" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2290"
    to              = "vlan-2290"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2291]-to-[vlan-2291]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2291" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2291"
    to              = "vlan-2291"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2292]-to-[vlan-2292]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2292" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2292"
    to              = "vlan-2292"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2293]-to-[vlan-2293]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2293" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2293"
    to              = "vlan-2293"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2294]-to-[vlan-2294]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2294" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2294"
    to              = "vlan-2294"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2295]-to-[vlan-2295]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2295" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2295"
    to              = "vlan-2295"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2296]-to-[vlan-2296]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2296" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2296"
    to              = "vlan-2296"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2297]-to-[vlan-2297]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2297" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2297"
    to              = "vlan-2297"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2298]-to-[vlan-2298]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2298" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2298"
    to              = "vlan-2298"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-2299]-to-[vlan-2299]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_2299" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-2299"
    to              = "vlan-2299"
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
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_101" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_102" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_103" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_104" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_105" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_106" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_107" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_108" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_109" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_110" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_111" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_112" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_113" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_114" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_115" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_116" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_117" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_118" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_119" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_120" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_121" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_122" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_123" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_124" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_125" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_126" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_127" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_128" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_129" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_130" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_131" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_132" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_133" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_134" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_135" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_136" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_137" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_138" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_139" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_140" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_141" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_142" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_143" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_144" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_145" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_146" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_147" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_148" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_149" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_150" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_151" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_152" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_153" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_154" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_155" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_156" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_157" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_158" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_159" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_160" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_161" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_162" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_163" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_164" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_165" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_166" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_167" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_168" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_169" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_170" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_171" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_172" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_173" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_174" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_175" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_176" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_177" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_178" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_179" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_180" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_181" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_182" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_183" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_184" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_185" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_186" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_187" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_188" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_189" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_190" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_191" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_192" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_193" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_194" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_195" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_196" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_197" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_198" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
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
resource "aci_ranges" "VLAN_Range_access_199" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-199"
    to              = "vlan-199"
}

/*
API Information:
 - Class: "fvnsEncapBlk"
 - Distinguished Name: "uni/infra/vlanns-[access]-static/from-[vlan-200]-to-[vlan-200]"
GUI Location:
 - Fabric > Access Policies > Pools > VLAN:[access] > Encap Blocks
*/
resource "aci_ranges" "VLAN_Range_access_200" {
    depends_on      = [
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-200"
    to              = "vlan-200"
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
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
        data.aci_vlan_pool.VLAN_Pool_access
    ]
    vlan_pool_dn    = data.aci_vlan_pool.VLAN_Pool_access.id
    from            = "vlan-299"
    to              = "vlan-299"
}

