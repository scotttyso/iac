#------------------------------------------
# Create a Static Node Mgmt Address
#------------------------------------------

/*
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-1]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_static_node_mgmt_address" "Pod_1_Node_1_Mgmt_EPG_in_band_EPG_default_Static_Address" {
    depends_on          = [
        aci_node_mgmt_epg.Mgmt_EPG_in_band_EPG_default
    ]
    management_epg_dn   = aci_node_mgmt_epg.Mgmt_EPG_in_band_EPG_default.id
    t_dn                = "topology/pod-1/node-1"
    type                = "in_band"
    addr                = "198.18.12.11/24"
    gw                  = "198.18.12.1"
    v6_addr             = "2001::4/64"
    v6_gw               = "2001::1"
}

