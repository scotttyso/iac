/*
API Information:
 - Class: "dnsRsProfileToEpg"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG
*/
resource "aci_rest" "dns_epg_oob-default" {
    path        = "/api/node/mo/uni/fabric/dnsp-default.json"
    class_name    = "dnsRsProfileToEpg"
    payload        = <<EOF
{
    "dnsRsProfileToEpg": {
        "attributes": {
            "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
        },
        "children": []
    }
}
    EOF
}

