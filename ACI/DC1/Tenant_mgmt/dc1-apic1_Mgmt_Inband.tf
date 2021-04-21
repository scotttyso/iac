/*
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "${var.}/rsinBStNode-[topology/pod-1/node-1]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "dc1-apic1_Mgmt_Inband" {
    path        = "/api/node/mo/uni/tn-mgmt.json"
    class_name  = "mgmtRsInBStNode"
    payload     = <<EOF
{
    "mgmtRsInBStNode": {
        "attributes": {
            "dn": "${var.}/rsinBStNode-[topology/pod-1/node-1]",
            "addr": "198.18.11.11/24",
            "gw": "198.18.11.1",
            "tDn": "topology/pod-1/node-1",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
    EOF
}

