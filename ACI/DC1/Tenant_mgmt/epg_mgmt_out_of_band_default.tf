/*
API Information:
 - Class: "mgmtOoB"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/oob-default"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > Out-of-Band EPG - default
*/

resource "aci_node_mgmt_epg" "out_of_band_default" {
    depends_on                  = [
        aci_rest.oob_mgmt_contract_mgmt_oob_Mgmt_In,
    ]
    management_profile_dn       = "uni/tn-mgmt/mgmtp-default"
    name                        = "default"
    # name_alias                  = "example"
    # pref_gr_memb                = "exclude"
    prio                        = "unspecified"
    type                        = "out_of_band"
    relation_mgmt_rs_oo_b_prov  = [
        aci_rest.oob_mgmt_contract_mgmt_oob_Mgmt_In.id,
    ]
}

