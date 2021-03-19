/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-mgmt/out-inband_L3/instP-inb_Ext/extsubnet-[0.0.0.0/1]"
GUI Location:
 - Tenants > mgmt > Networking > L3Outs > inband_L3 > External EPGs > inb_Ext
*/
resource "aci_l3_ext_subnet" "inb_Ext_0-0-0-0_1" {
    depends_on                              = [data.aci_tenant.mgmt,aci_l3_outside.mgmt_inband_L3,aci_external_network_instance_profile.inband_L3_inb_Ext]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.inband_L3_inb_Ext.id
	description                             = "Inband L3Out"
    ip                                      = "0.0.0.0/1"
    scope                                   = ["import-security"]
}

