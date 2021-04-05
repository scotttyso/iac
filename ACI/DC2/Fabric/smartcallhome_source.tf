/*
API Information:
 - Class: "callhomeSmartSrc"
 - Distinguished Name: "uni/infra/moninfra-default/smartchsrc"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:Smart CallHome > Create Smart CallHome Source
*/
resource "aci_rest" "callhomeSmartSrc" {
    path        = "/api/node/mo/uni/infra/moninfra-default/smartchsrc.json"
    class_name  = "callhomeSmartSrc"
    payload     = <<EOF
{
    "callhomeSmartSrc": {
        "attributes": {
            "dn": "uni/infra/moninfra-default/smartchsrc",
            "incl": "audit,events,faults,session",
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

