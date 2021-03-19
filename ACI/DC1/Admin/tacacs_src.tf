/*
API Information:
 - Class: "tacacsSrc"
 - Distinguished Name: "uni/fabric/moncommon/tacacssrc-TACACS_Src"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policies > Callhome/Smart Callhome/SNMP/Syslog/TACACS:TACACS > Create TACACS Source
*/
resource "aci_rest" "tacacsSrc" {
	path		= "/api/node/mo/uni/fabric/moncommon/tacacssrc-TACACS_Src.json"
	class_name	= "tacacsSrc"
	payload		= <<EOF
{
    "tacacsSrc": {
        "attributes": {
            "dn": "uni/fabric/moncommon/tacacssrc-TACACS_Src",
            "name": "TACACS_Src",
            "rn": "tacacssrc-TACACS_Src"
        },
        "children": [
            {
                "tacacsRsDestGroup": {
                    "attributes": {
                        "tDn": "uni/fabric/tacacsgroup-TACACS_acct"
                    },
                    "children": []
                }
            }
        ]
    }
}
	EOF
}

