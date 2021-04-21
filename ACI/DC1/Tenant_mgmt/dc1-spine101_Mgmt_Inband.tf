/*
API Information:
 - Class: "mgmtRsInBStNode"
 - Distinguished Name: "${var.}/rsinBStNode-[topology/pod-1/node-101]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "dc1-spine101_Mgmt_Inband" {
    depends_on  = [aci_fabric_node_member.dc1-spine101]
    path        = "/api/node/mo/uni/tn-mgmt.json"
    class_name  = "mgmtRsInBStNode"
    payload     = <<EOF
{
    "mgmtRsInBStNode": {
        "attributes": {
            "dn": "${var.}/rsinBStNode-[topology/pod-1/node-101]",
            "addr": "198.18.11.101/24",
            "gw": "198.18.11.1",
            "tDn": "topology/pod-1/node-101",
            "v6Addr": "2001::101/64",
            "v6Gw": "2001::1"
        }
    }
}
    EOF
}

