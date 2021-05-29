#------------------------------------------
# Create a Static Node Mgmt Address
#------------------------------------------

/*
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-2]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_static_node_mgmt_address" "Pod_1_Node_2_Mgmt_EPG_in_band_EPG_default_Static_Address" {
    depends_on          = [
        aci_node_mgmt_epg.Mgmt_EPG_in_band_EPG_default
    ]
    management_epg_dn   = aci_node_mgmt_epg.Mgmt_EPG_in_band_EPG_default.id
    t_dn                = "topology/pod-1/node-2"
    type                = "in_band"
    addr                = "10.92.0.2/24"
    gw                  = "10.92.0.254"
    v6_addr             = "::"
    v6_gw               = "::"
}

