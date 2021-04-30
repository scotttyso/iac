/*
API Information:
 - Class: "mgmtInB"
 - Distinguished Name: "uni/tn-mgmt/mgmtp-default/inb-default"
GUI Location:
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default
*/

resource "aci_node_mgmt_epg" "mgmt_epg_in_band_default" {
    depends_on                  = [
        aci_bridge_domain.mgmt_inb,
        aci_contract.mgmt_contract_Mgmt_Out,
        aci_contract.mgmt_contract_Mgmt_In,
    ]
    management_profile_dn       = "uni/tn-mgmt/mgmtp-default"
    name                        = "default"
    encap                       = "811"
    match_t                     = "AtleastOne"
    # name_alias                  = "example"
    # pref_gr_memb                = "exclude"
    prio                        = "unspecified"
    type                        = "in_band"
    relation_fv_rs_cons         = [
        aci_contract.mgmt_contract_Mgmt_Out.id,
    ]
    relation_fv_rs_prov         = [
        aci_contract.mgmt_contract_Mgmt_In.id,
    ]
    relation_mgmt_rs_mgmt_bd    = aci_bridge_domain.mgmt_inb.id
}

