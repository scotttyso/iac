/*
API Information:
 - Class: "l3extInstP"
 - Distinguised Name: "/uni/tn-mgmt/out-inband_L3/instP-inb_Ext"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband_L3 > External EPGs > inb_Ext
*/
resource "aci_external_network_instance_profile" "inband_L3_inb_Ext" {
    depends_on                                  = [data.aci_tenant.mgmt,aci_l3_outside.mgmt_inband_L3]
    l3_outside_dn                               = aci_l3_outside.mgmt_inband_L3.id
    description                                 = "Inband External EPG"
    name                                        = "inb_Ext"
    flood_on_encap                              = "disabled"
    match_t                                     = "AtleastOne"
    pref_gr_memb                                = "exclude"
    prio                                        = "level3"
    target_dscp                                 = "unspecified"
}

