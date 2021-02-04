/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sda
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sda
*/
resource "aci_application_epg" "sap_intg_sap_sda" {
	depends_on						= [aci_tenant.prod,aci_application_profile.prod_sap_intg]
	application_profile_dn			= aci_application_profile.prod_sap_intg.id
	name							= "sap_sda"
	description						= "SAP HANA - Smart Data Access"
	flood_on_encap					= "disabled"
	has_mcast_source				= "no"
	is_attr_based_epg				= "no"
	match_t							= "AtleastOne"
	pc_enf_pref						= "enforced"
	pref_gr_memb					= "include"
	prio							= "level3"
	shutdown						= "no"
	relation_fv_rs_bd				= aci_bridge_domain.prod_sap_itg.id
	relation_fv_rs_aepg_mon_pol		= "uni/tn-common/monepg-default"
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-prod/ap-sap_intg/epg-sap_sda/rsdomAtt-[uni/phys-Access_phys]
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sda > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "sap_intg_sap_sda_phys-Access_phys" {
	depends_on		= [aci_application_epg.sap_intg_sap_sda]
	path		= "/api/node/mo/uni/tn-prod/ap-sap_intg/epg-sap_sda.json"
	class_name	= "fvRsDomAtt"
	payload		= <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-Access_phys"
        },
        "children": []
    }
}
	EOF
}

/*
API Information:
 - Class: "fvRsPathAtt"
 - Distinguished Name: "uni/tn-prod/ap-sap_intg/epg-sap_sda/rspathAtt-[topology/pod-1/protpaths-201-202/pathep-[pg_vpc7_dc1-leaf201]"
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sda > Static Ports > Pod-1/Node-201-202/pg_vpc7_dc1-leaf201
*/
resource "aci_epg_to_static_path" "sap_intg_sap_sda_Pod-1_Nodes-201-202_pg_vpc7_dc1-leaf201" {
	depends_on           = [aci_application_epg.sap_intg_sap_sda]
	application_epg_dn   = aci_application_epg.sap_intg_sap_sda.id
	tdn                  = "topology/pod-1/protpaths-201-202/pathep-[pg_vpc7_dc1-leaf201]"
	encap                = "vlan-203"
	mode                 = "regular"
}

/*
API Information:
 - Class: "fvRsPathAtt"
 - Distinguished Name: "uni/tn-prod/ap-sap_intg/epg-sap_sda/rspathAtt-[topology/pod-1/protpaths-201-202/pathep-[pg_vpc9_dc1-leaf201]"
GUI Location:
Tenants > prod > Application Profiles > sap_intg > Application EPGs > sap_sda > Static Ports > Pod-1/Node-201-202/pg_vpc9_dc1-leaf201
*/
resource "aci_epg_to_static_path" "sap_intg_sap_sda_Pod-1_Nodes-201-202_pg_vpc9_dc1-leaf201" {
	depends_on           = [aci_application_epg.sap_intg_sap_sda]
	application_epg_dn   = aci_application_epg.sap_intg_sap_sda.id
	tdn                  = "topology/pod-1/protpaths-201-202/pathep-[pg_vpc9_dc1-leaf201]"
	encap                = "vlan-203"
	mode                 = "regular"
}

