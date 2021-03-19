/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-dc2-dmz_L3/instP-dmz_Ext/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc2-dmz_L3 > External EPGs > dmz_Ext
*/
resource "aci_l3_ext_subnet" "dmz_Ext_0-0-0-0_1" {
    depends_on                              = [data.aci_tenant.common,aci_l3_outside.common_dc2-dmz_L3,aci_external_network_instance_profile.dc2-dmz_L3_dmz_Ext]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.dc2-dmz_L3_dmz_Ext.id
	description                             = "DC2 DMZ L3Out"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

