/*
API Information:
 - Class: "l3extSubnet"
 - Distinguised Name: "/uni/tn-common/out-dc1-prod_L3/instP-prod_Ext/extsubnet-[128.0.0.0/1]"
GUI Location:
 - Tenants > common > Networking > L3Outs > dc1-prod_L3 > External EPGs > prod_Ext
*/
resource "aci_l3_ext_subnet" "prod_Ext_128-0-0-0_1" {
    depends_on                              = [data.aci_tenant.common,aci_l3_outside.common_dc1-prod_L3,aci_external_network_instance_profile.dc1-prod_L3_prod_Ext]
    external_network_instance_profile_dn    = aci_external_network_instance_profile.dc1-prod_L3_prod_Ext.id
	description                             = "DC1 Production L3Out"
    ip                                      = "128.0.0.0/1"
    scope                                   = ["import-security"]
}

