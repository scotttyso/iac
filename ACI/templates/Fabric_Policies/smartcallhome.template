/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-SmartCallHome_dg"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Dest Group]
*/
resource "aci_rest" "SmartCallHome_dg" {
	path		= "/api/node/mo/uni/fabric/smartgroup-SmartCallHome_dg.json"
	class_name	= "callhomeSmartGroup"
	payload		= <<EOF
{
    "callhomeSmartGroup": {
        "attributes": {
            "dn": "uni/fabric/smartgroup-SmartCallHome_dg",
            "name": "SmartCallHome_dg",
            "rn": "smartgroup-SmartCallHome_dg"
        },
        "children": [
            {
                "callhomeProf": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-SmartCallHome_dg/prof",
                        "port": "{{SMTP_Port}}",
                        "from": "{{From_Email}}",
                        "replyTo": "{{Reply_Email}}",
                        "email": "{{To_Email}}",
{%- if Phone_Number %}
                        "phone": "{{Phone_Number}}",{% endif %}
{%- if Contact_Info %}
                        "contact": "{{Contact_Info}}",{% endif %}
{%- if Street_Address %}
                        "addr": "{{Street_Address}}",{% endif %}
                        "contract": "{{Contract_ID}}",
                        "customer": "{{Customer_Identifier}}",
                        "site": "{{Site_Identifier}}",
                        "rn": "prof"
                    },
                    "children": [
                        {
                            "callhomeSmtpServer": {
                                "attributes": {
                                    "dn": "uni/fabric/smartgroup-SmartCallHome_dg/prof/smtp",
                                    "host": "{{SMTP_Relay}}",
                                    "rn": "smtp"
                                },
                                "children": [
                                    {
                                        "fileRsARemoteHostToEpg": {
                                            "attributes": {
                                                "tDn": "uni/tn-mgmt/mgmtp-default/{{Mgmt_Domain}}"
                                            },
                                            "children": []
                                        }
                                    }
                                ]
                            }
                        }
                    ]
                }
            },
            {
                "callhomeSmartDest": {
                    "attributes": {
                        "dn": "uni/fabric/smartgroup-SmartCallHome_dg/smartdest-SCH_Receiver",
                        "name": "SCH_Receiver",
                        "email": "{{Reply_Email}}",
                        "format": "short-txt",
                        "rn": "smartdest-SCH_Receiver"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

/*
API Information:
 - Class: "callhomeSmartSrc"
 - Distinguished Name: "uni/infra/moninfra-default/smartchsrc"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source
*/
resource "aci_rest" "callhomeSmartSrc" {
	path		= "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
	class_name	= "callhomeSmartSrc"
	payload		= <<EOF
{
    "callhomeSmartSrc": {
        "attributes": {
            "dn": "uni/infra/moninfra-default/smartchsrc",
            "rn": "smartchsrc"
        },
        "children": [
            {
                "callhomeRsSmartdestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/smartgroup-SmartCallHome_dg"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}