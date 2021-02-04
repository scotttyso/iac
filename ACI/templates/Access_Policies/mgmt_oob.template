/*
API Information:
 - Class: "mgmtRsOoBStNode"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default/rsooBStNode-[topology/pod-{{Pod_ID}}/node-{{Name}}]"
GUI Location:
 - Tenants > mgmt > Node Management Addresses > Static Node Management Addresses
*/
resource "aci_rest" "oob_mgmt_{{Name}}_{{OOB_GW_}}" {
	path		= "/api/node/mo/uni/tn-mgmt.json"
	class_name	= "mgmtRsOoBStNode"
	payload		= <<EOF
{
    "mgmtRsOoBStNode": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/oob-default/rsooBStNode-[topology/pod-{{Pod_ID}}/node-{{Node_ID}}]",
            "addr": "{{OOB_IP}}",
            "gw": "{{OOB_GW}}",
            "tDn": "topology/pod-{{Pod_ID}}/node-{{Node_ID}}",
            "v6Addr": "::",
            "v6Gw": "::"
        }
    }
}
	EOF
}