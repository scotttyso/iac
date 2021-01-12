resource "aci_subnet" "inb_subnet" {
	parent_dn  = aci_bridge_domain.inb.id
	ip         = "198.18.2.1/24"
	scope      = ["public"]
}

resource "aci_rest" "inb_mgmt_default_epg" {
	depends_on		= [aci_vlan_pool.default]
	path		= "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default.json"
	class_name	= "mgmtInB"
	payload		= <<EOF
{
    "mgmtInB": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default",
            "descr": "Default Inband Mmgmt EPG Used by Terraform Startup Wizard.",
            "encap": "vlan-100",
            "name": "default"
        },
        "children": [
            {
                "mgmtRsMgmtBD": {
                    "attributes": {
                        "tnFvBDName": "inb"
                    }
                }
            }
        ]
    }
}
	EOF
}

