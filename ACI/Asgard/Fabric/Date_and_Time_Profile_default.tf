/*
API Information:
 - Class: "datetimePol"
 - Distinguished Name: "uni/fabric/time-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default
*/
resource "aci_rest" "Date_And_Time_default" {
    path           = "/api/node/mo/uni/fabric/time-default.json"
    class_name     = "datetimePol"
    payload        = <<EOF
{
    "datetimePol": {
        "attributes": {
            "adminSt": "enabled",
            "authSt": "disabled",
            "descr": "Default Date and Time Profile",
            "dn": "uni/fabric/time-default",
            "masterMode": "disabled",
            "name": "default",
            "serverState": "disabled",
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-10.101.128.15"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "default_ntp_10-101-128-15" {
    depends_on  = [
        aci_rest.Date_And_Time_default
    ]
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-10.101.128.15.json"
    class_name  = "datetimeNtpProv"
    payload     = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "descr": "Richfield AD1",
            "dn": "uni/fabric/time-default/ntpprov-10.101.128.15",
            "minPoll": "4",
            "name": "10.101.128.15",
            "preferred": "no",
            "trueChimer": "disabled",
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-10.101.128.16"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "default_ntp_10-101-128-16" {
    depends_on  = [
        aci_rest.Date_And_Time_default
    ]
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-10.101.128.16.json"
    class_name  = "datetimeNtpProv"
    payload     = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "descr": "Richfield AD2",
            "dn": "uni/fabric/time-default/ntpprov-10.101.128.16",
            "minPoll": "4",
            "name": "10.101.128.16",
            "preferred": "yes",
            "trueChimer": "disabled",
        },
        "children": [
            {
                "datetimeRsNtpProvToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

