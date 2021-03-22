/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-198.18.1.52"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "ntp_198-18-1-52" {
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.52.json"
    class_name    = "datetimeNtpProv"
    payload        = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.52",
            "name": "198.18.1.52",
            "preferred": "true",
            "rn": "ntpprov-198.18.1.52"
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "uni/tn-mgmt/mgmtp-default/oob-default"
                    }
                }
            }
        ]
    }
}
    EOF
}

