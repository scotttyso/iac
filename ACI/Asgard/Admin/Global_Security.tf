#----------------------------------------------
# Create a Maintenance Group Policy
#----------------------------------------------

/*
API Information:
 - Class: "aaaUserEp"
 - Distinguished Name: "uni/userext"
GUI Location:
 - Admin > AAA > Security
*/
resource "aci_rest" "Global_Security_Settings" {
    path        = "/api/node/mo/uni/userext.json"
    class_name  = "aaaUserEp"
    payload     = <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext",
            "pwdStrengthCheck": "yes"
        },
        "children": [
            {
                "aaaPwdProfile": {
                    "attributes": {
                        "changeCount": "2",
                        "changeDuringInterval": "enable",
                        "dn": "uni/userext/pwdprofile",
                        "expirationWarnTime": "15",
                        "noChangeInterval": "48",
                        "historyCount": "5"
                    },
                    "children": []
                }
            },
            {
                "aaaBlockLoginProfile": {
                    "attributes": {
                        "blockDuration": "60",
                        "dn": "uni/userext/blockloginp",
                        "enableLoginBlock": "disable",
                        "maxFailedAttempts": "5",
                        "maxFailedAttemptsWindow": "5",
                    },
                    "children": []
                }
            },
            {
                "pkiEp": {
                    "attributes": {
                        "dn": "uni/userext/pkiext"
                    },
                    "children": [
                        {
                            "pkiWebTokenData": {
                                "attributes": {
                                    "dn": "uni/userext/pkiext/webtokendata",
                                    "maximumValidityPeriod": "24",
                                    "webtokenTimeoutSeconds": "600",
                                    "uiIdleTimeoutSeconds": "65525"
                                },
                                "children": []
                            }
                        }
                    ]
                }
            }
        ]
    }
}
    EOF
}

