/*
API Information:
 - Class: "fvSubnet"
 - Distinguished Name: "uni/tn-mgmt/BD-inb/subnet-[198.18.12.1/24]"
GUI Location:
 - Tenants > mgmt > Networking > Bridge Domains > inb > Subnets > 198.18.12.1/24
*/
resource "aci_subnet" "inb_subnet" {
	parent_dn  = data.aci_bridge_domain.inb.id
	ip         = "198.18.12.1/24"
	scope      = ["public"]
}

/*
API Information:
 - Class: "mgmtInB"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default
*/
resource "aci_rest" "inb_mgmt_default_epg" {
	depends_on		= [aci_vlan_pool.inband]
	path		= "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default.json"
	class_name	= "mgmtInB"
	payload		= <<EOF
{
    "mgmtInB": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default",
            "descr": "Default Inband Mmgmt EPG Used by Terraform Startup Wizard.",
            "encap": "vlan-912",
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

