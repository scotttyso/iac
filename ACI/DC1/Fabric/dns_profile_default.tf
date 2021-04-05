/*
API Information:
 - Class: "dnsRsProfileToEpg"
 - Distinguished Name: "uni/fabric/dnsp-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG
*/
resource "aci_rest" "dns_profile_default" {
    path        = "/api/node/mo/uni/fabric/dnsp-default.json"
    class_name  = "dnsProfile"
    payload     = <<EOF
{
    "dnsProfile": {
        "attributes": {
            "IPVerPreference": "IPv4",
            "descr": "default DNS Profile",
            "dn": "uni/fabric/dnsp-default",
            "name": "default"
        },
        "children": [
            {
                "dnsRsProfileToEpg": {
                    "attributes": {
                        "tDn": "${var.Out-of-Band}"
                    }
                }
            },
        ]
    }
}
    EOF
}

