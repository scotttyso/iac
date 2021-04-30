/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > default
*/
resource "aci_rest" "tacacsGroup_default" {
    path        = "/api/node/mo/uni/fabric/tacacsgroup-default.json"
    class_name  = "tacacsGroup"
    payload     = <<EOF
{
    "tacacsGroup": {
        "attributes": {
            "descr": "TACACS Accounting ",
            "dn": "uni/fabric/tacacsgroup-default",
            "name": "default",
        }
    }
}
    EOF
}

/*
API Information:
 - Class: "tacacsSrc"
 - Distinguished Name: "uni/fabric/moncommon/tacacssrc-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacsSrc_default" {
    depends_on  = [
        aci_rest.tacacsGroup_default
    ]
    path        = "/api/node/mo/uni/fabric/moncommon/tacacssrc-default.json"
    class_name  = "tacacsSrc"
    payload     = <<EOF
{
    "tacacsSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/tacacssrc-default",
            "name": "default",
        },
        "children": [
            {
                "tacacsRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/tacacsgroup-default"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

