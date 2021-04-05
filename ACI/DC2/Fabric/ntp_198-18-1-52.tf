/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-198.18.1.52"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "ntp_198-18-1-52" {
    depends_on  = [aci_rest.date_and_time_default]
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.52.json"
    class_name  = "datetimeNtpProv"
    payload     = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "descr": "NTP Server 198.18.1.52",
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.52",
            "maxPoll": "",
            "minPoll": "",
            "name": "198.18.1.52",
            "preferred": "yes",
            "trueChimer": "disabled",
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "${var.Out-of-Band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

