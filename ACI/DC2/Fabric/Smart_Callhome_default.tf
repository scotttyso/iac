/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > [Smart CallHome Dest Group]
*/
resource "aci_rest" "Smart_Callhome_DestGrp_default" {
    path        = "/api/node/mo/uni/fabric/smartgroup-default.json"
    class_name  = "callhomeSmartGroup"
    payload     = <<EOF
{
    "callhomeSmartGroup": {
        "attributes": {
            "descr": "Smart CallHome Destination Group Description",
            "dn": "uni/fabric/smartgroup-default",
            "name": "default",
        },
        "children": [
            {
                "callhomeProf": {
                    "attributes": {
                        "addr": "5555 Some Street San Jose, CA 95000",
                        "contract": "",
                        "contact": "Customer XYZ",
                        "customer": "",
                        "dn": "uni/fabric/smartgroup-default/prof",
                        "email": "network-ops@example.com",
                        "from": "cust-aci-fabric@example.com",
                        "replyTo": "network-ops@example.com",
                        "phone": "+1 408-555-5555",
                        "port": "25",
                        "site": "",
                        "rn": "prof"
                    },
                    "children": [
                        {
                            "callhomeSmtpServer": {
                                "attributes": {
                                    "dn": "uni/fabric/smartgroup-default/prof/smtp",
                                    "host": "smtp.example.com",
                                    "rn": "smtp"
                                },
                                "children": [
                                    {
                                        "fileRsARemoteHostToEpg": {
                                            "attributes": {
                                                "tDn": "${var.out_of_band}"
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
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "callhomeSmartGroup"
 - Distinguished Name: "uni/fabric/smartgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > Smart Callhome > default > default
*/
resource "aci_rest" "Smart_Callhome_DestGrp_default_Receiver_default" {
    depends_on  = [
        aci_rest.Smart_Callhome_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/smartgroup-default.json"
    class_name  = "callhomeSmartDest"
    payload     = <<EOF
{
    "callhomeSmartDest": {
        "attributes": {
            "dn": "uni/fabric/smartgroup-default/smartdest-default",
            "email": "network-ops@example.com",
            "format": "short-txt",
            "name": "default",
            "rfcCompliant": "no",
        },
        "children": []
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
resource "aci_rest" "Smart_Callhome_Source" {
    depends_on  = [
        aci_rest.Smart_Callhome_DestGrp_default
    ]
    path        = "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
    class_name  = "callhomeSmartSrc"
    payload     = <<EOF
{
    "callhomeSmartSrc": {
        "attributes": {
            "dn": "uni/infra/moninfra-default/smartchsrc",
        },
        "children": [
            {
                "callhomeRsSmartdestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/smartgroup-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

