#------------------------------------------
# Create a Out-Of-Band Contract
#------------------------------------------

/*
API Information:
 - Class: "vzOOBBrCP"
 - Distinguished Name: "uni/tn-mgmt/oobbrc-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Contracts > Out-Of-Band Contracts: Mgmt_Out
*/
resource "aci_rest" "Tenant_mgmt_Contract_Type_OOB_Mgmt_Out" {
    path        = "/api/node/mo/uni/tn-mgmt/oobbrc-Mgmt_Out.json"
    class_name  = "vzOOBBrCP"
    payload     = <<EOF
{
    "vzOOBBrCP": {
        "attributes": {
            "descr": "Out-of-Band Outbound Traffic",
            "dn": "uni/tn-mgmt/oobbrc-Mgmt_Out",
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


