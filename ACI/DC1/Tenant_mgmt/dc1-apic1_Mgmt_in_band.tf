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
resource "aci_static_node_mgmt_address" "Pod_1_Node__in_band_Static_Address" {
    depends_on          = [
        aci_node_mgmt_epg.default
    ]
    management_epg_dn   = aci_node_mgmt_epg.in_band_default.id
    t_dn                = "topology/pod-1/node-"
    type                = "in_band"
    addr                = "198.18.11.11/24"
    gw                  = "198.18.11.1"
    v6_addr             = "::"
    v6_gw               = "::"
}

