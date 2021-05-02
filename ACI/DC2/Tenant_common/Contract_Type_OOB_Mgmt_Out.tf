#------------------------------------------
# Create a Out-Of-Band Contract
#------------------------------------------

/*
API Information:
 - Class: "vzOOBBrCP"
 - Distinguished Name: "uni/tn-common/oobbrc-Mgmt_Out"
GUI Location:
 - Tenants > common > Contracts > Out-Of-Band Contracts: Mgmt_Out
*/
resource "aci_rest" "Tenant_common_Contract_Type_OOB_Mgmt_Out" {
    path        = "/api/node/mo/uni/tn-common/oobbrc-Mgmt_Out.json"
    class_name  = "vzOOBBrCP"
    payload     = <<EOF
{
    "vzOOBBrCP": {
        "attributes": {
            "descr": "Out-of-Band Outbound Traffic",
            "dn": "uni/tn-common/oobbrc-Mgmt_Out",
            "name": "Mgmt_Out",
            "prio": "unspecified",
            "scope": "global",
            "targetDscp": "unspecified"
        },
        "children": [ ]
    }
}
    EOF
}


