/*
API Information:
 - Class: "datetimePol"
 - Distinguished Name: "uni/fabric/time-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default
*/
resource "aci_rest" "date_and_time_default" {
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
 - Class: "datetimeNtpAuthKey"
 - Distinguished Name: "uni/fabric/time-default/ntpauth-1"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: Authentication Keys: 1
*/
resource "aci_rest" "default_key_1" {
    depends_on  = [aci_rest.date_and_time_default]
    path        = "/api/node/mo/uni/fabric/time-default/ntpauth-1.json"
    class_name  = "datetimeNtpAuthKey"
    payload     = <<EOF
{
    "datetimeNtpAuthKey": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpauth-1",
            "id": "1",
            "key": "${var.NTP_Key1}",
            "keyType": "sha1"
        },
    }
}
    EOF
}

/*
API Information:
 - Class: "datetimeNtpAuthKey"
 - Distinguished Name: "uni/fabric/time-default/ntpauth-2"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: Authentication Keys: 2
*/
resource "aci_rest" "default_key_2" {
    depends_on  = [aci_rest.date_and_time_default]
    path        = "/api/node/mo/uni/fabric/time-default/ntpauth-2.json"
    class_name  = "datetimeNtpAuthKey"
    payload     = <<EOF
{
    "datetimeNtpAuthKey": {
        "attributes": {
            "dn": "uni/fabric/time-default/ntpauth-2",
            "id": "2",
            "key": "${var.NTP_Key2}",
            "keyType": "md5"
        },
    }
}
    EOF
}

/*
API Information:
 - Class: "datetimeNtpProv"
 - Distinguished Name: "uni/fabric/time-default/ntpprov-198.18.1.51"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "default_ntp_198-18-1-51" {
    depends_on  = [aci_rest.date_and_time_default]
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.51.json"
    class_name  = "datetimeNtpProv"
    payload     = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "descr": "NTP Server 198.18.1.51",
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.51",
            "minPoll": "4",
            "name": "198.18.1.51",
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
 - Distinguished Name: "uni/fabric/time-default/ntpprov-198.18.1.52"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > Date and Time > Policy default: NTP Servers
*/
resource "aci_rest" "default_ntp_198-18-1-52" {
    depends_on  = [aci_rest.date_and_time_default]
    path        = "/api/node/mo/uni/fabric/time-default/ntpprov-198.18.1.52.json"
    class_name  = "datetimeNtpProv"
    payload     = <<EOF
{
    "datetimeNtpProv": {
        "attributes": {
            "descr": "NTP Server 198.18.1.52",
            "dn": "uni/fabric/time-default/ntpprov-198.18.1.52",
            "minPoll": "4",
            "name": "198.18.1.52",
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

