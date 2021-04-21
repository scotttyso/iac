/*
API Information:
 - Class: "mgmtRsOoBStNode"
 - Distinguished Name: "${var.}/rsooBStNode-[topology/pod-1/node-dc1-spine101]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "dc1-spine101_Mgmt_Out-of-Band" {
    depends_on  = [aci_fabric_node_member.dc1-spine101]
    path        = "/api/node/mo/uni/tn-mgmt.json"
    class_name  = "mgmtRsOoBStNode"
    payload     = <<EOF
{
    "mgmtRsOoBStNode": {
        "attributes": {
            "dn": "${var.}/rsooBStNode-[topology/pod-1/node-101]",
            "addr": "198.18.1.101/24",
            "gw": "198.18.1.1",
            "tDn": "topology/pod-1/node-101",
            "v6Addr": "2002::101/64",
            "v6Gw": "2001::1"
        }
    }
}
    EOF
}

