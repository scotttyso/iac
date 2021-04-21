/*
API Information:
 - Class: "mgmtInB"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default
*/
resource "aci_rest" "inband_epg_default" {
    path        = "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default.json"
    class_name  = "mgmtInB"
    payload     = <<EOF
{
    "mgmtInB": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default",
            "encap": "vlan-",
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

