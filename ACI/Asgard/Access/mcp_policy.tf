/*
- This Resource File will create Recommended Default Policies Based on the Best Practice Wizard and additional Best Practices
*/

/*
API Information:
 - Class: "mcpInstPol"
 - Distinguished Named "uni/infra/mcpInstP-default"
GUI Location:
 - Fabric > Access Policies > Policies > Global > MCP Instance Policy Default
*/
resource "aci_rest" "MCP_Instance_Policy_Default" {
    path       = "/api/node/mo/uni/infra/mcpInstP-default.json"
    class_name = "mcpInstPol"
    payload    = <<EOF
{
    "mcpInstPol": {
        "attributes": {
            "adminSt": "enabled",
            "ctrl": "pdu-per-vlan",
            "descr": "Default MCP PDU per VLAN Policy",
            "dn": "uni/infra/mcpInstP-default",
            "initDelayTime": "180",
            "key": "${var.MCP_Key1}",
            "loopDetectMult": "3",
            "loopProtectAct": "port-disable",
            "txFreq": "2",
            "txFreqMsec": "0",
        },
        "children": []
    }
},
    EOF
}

