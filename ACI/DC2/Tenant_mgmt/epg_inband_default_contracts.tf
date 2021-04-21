/*
API Information:
 - Class: "fvRsCons"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_Out"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default: Consumed Contracts
*/
resource "aci_rest" "inband_epg_default_consumed_Mgmt_Out" {
    depends_on  = [aci_rest.inband_epg_default,aci_contract.mgmt_Mgmt_Out]
    path        = "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_Out.json"
    class_name  = "fvRsCons"
    payload     = <<EOF
{
    "fvRsCons": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_Out",
            "tnVzBrCPName": "Mgmt_Out",
            "prio": "unspecified"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "fvRsProv"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_In"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default: Provided Contracts
*/
resource "aci_rest" "inband_epg_default_provided_Mgmt_In" {
    depends_on  = [aci_rest.inband_epg_default,aci_contract.mgmt_Mgmt_In]
    path        = "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_In.json"
    class_name  = "fvRsProv"
    payload     = <<EOF
{
    "fvRsProv": {
        "attributes": {
            "dn": "uni/tn-mgmt/mgmtp-default/inb-default/rscons-Mgmt_In",
            "tnVzBrCPName": "Mgmt_In",
            "prio": "unspecified"
        },
        "children": []
    }
}
    EOF
}

