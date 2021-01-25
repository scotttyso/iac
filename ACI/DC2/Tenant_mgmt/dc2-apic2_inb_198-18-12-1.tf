/*
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-1]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "inb_mgmt_dc2-apic2_198-18-12-1" {
	depends_on  = [aci_application_epg.inb_default]
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsInBStNode"
	payload		= <<EOF
{
    "mgmtRsInBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default/rsinBStNode-[topology/pod-1/node-1]",
            "addr": "198.18.12.11/24",
            "gw": "198.18.12.1",
            "tDn": "topology/pod-1/node-1",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}

