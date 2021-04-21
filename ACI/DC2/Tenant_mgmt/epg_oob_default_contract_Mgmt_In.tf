
/*
API Information:
 - Class: "mgmtRsOoBProv"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default/rsooBProv-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > Out-Of-Band EPG - default: Mgmt_In
*/
resource "aci_rest" "mgmt_oob_default_contract_Mgmt_In" {
    depends_on  = [aci_rest.oob_mgmt_contract_]
    path        = "/api/node/mo/uni/tn-mgmt/mgmtp-default/oob-default/rsooBProv-Mgmt_In.json"
    class_name  = "mgmtRsOoBProv"
    payload     = <<EOF
{
    "mgmtRsOoBProv": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/oob-default/rsooBProv-Mgmt_In",
            "tnVzOOBBrCPName": "Mgmt_In",
            "prio": "unspecified",
        },
        "children": []
    }
}
    EOF
}

