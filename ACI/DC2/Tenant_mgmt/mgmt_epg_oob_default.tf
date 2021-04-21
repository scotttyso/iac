/*
API Information:
 - Class: "mgmtOoB"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > Out-of-Band EPG - default
*/
resource "aci_rest" "out-of-band_epg_default" {
    path        = "/api/node/mo/uni/tn-mgmt/mgmtp-default/oob-default.json"
    class_name  = "mgmtOoB"
    payload     = <<EOF
{
    "mgmtOoB": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/oob-default",
            "name": "default"
        },
        "children": [ ]
    }
}
    EOF
}

