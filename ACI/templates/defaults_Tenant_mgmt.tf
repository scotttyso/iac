/*
- This Resource File will create Recommended Default Policies for Tenants (Mostly the mgmt Tenant)
*/

/*
Assign Data Source for Tenants
- common
- mgmt
Inband Bridge Domain and Tenant common - Default Contract
*/
data "aci_tenant" "common" {
	name	= "common"
}

data "aci_tenant" "mgmt" {
	name	= "mgmt"
}

data "aci_bridge_domain" "inb" {
	tenant_dn	= aci_tenant.mgmt.id
	name		= "inb"
}

data "aci_contract" "default" {
	tenant_dn	= aci_tenant.common.id
	name		= "default"
}

/*
Create an Application Profile for Inband
 - Tenants > mgmt > Application Profiles
*/
resource "aci_application_profile" "inb_ap" {
	tenant_dn              = aci_tenant.mgmt.id
	name                   = "inb_ap"
}

/*
Create the default EPG for Inband Management and assign to the inb_ap Application Profile
 - Tenants > mgmt > Application Profiles > inb_ap > Application EPGs > Create 'default'
*/
resource "aci_application_epg" "inb_default" {
	application_profile_dn = aci_application_profile.inb_ap.id
	name                   = "default"
	description            = "Inband Mgmt EPG for APIC and Switch Management"
}

/*
Create the Contracts to be used by the Inband Management EPG
 - Tenants > mgmt > Contracts > Standard: [Contract Name]
 - Mgmt_In_Ct
 - Mgmt_Out_Ct
*/
resource "aci_contract" "Mgmt_In_Ct" {
	tenant_dn   = aci_tenant.mgmt.id
	description = "Default Mgmt Contract"
	name        = "Mgmt_In_Ct"
	scope       = "tenant"
	filter {
		  description = "Mgmt Traffic"
		  filter_entry {
				entry_description	= "Allow https"
			filter_entry_name   	= "https"
				d_from_port        	= "https"
				d_to_port	        = "https"
				ether_t             = "ipv4"
				prot            	= "tcp"
				stateful			= "yes"  
		  }
		  filter_entry {
				entry_description   = "Allow icmp"
			filter_entry_name   	= "icmp"
				d_from_port        	= "unspecified"
				d_to_port        	= "unspecified"
				ether_t             = "ipv4"
				prot           		= "icmp"
		  }
		  filter_entry {
				entry_description   = "Allow SNMP"
			filter_entry_name   	= "snmp"
				d_from_port        	= "161"
				d_to_port        	= "162"
				ether_t             = "ipv4"
				prot           		= "udp"
		  }
		  filter_entry {
				entry_description   = "Allow ssh"
			filter_entry_name   	= "ssh"
				d_from_port        	= "22"
				d_to_port        	= "22"
				ether_t             = "ipv4"
				prot           		= "tcp" 
				stateful			= "yes" 
		  }
		  filter_name  = "Mgmt_In_Flt"
	}
}

resource "aci_contract" "Mgmt_Out_Ct" {
	tenant_dn   = aci_tenant.mgmt.id
	description = "Default Mgmt Contract Outbound"
	name        = "Mgmt_Out_Ct"
	scope       = "tenant"
	filter {
		  description = "Mgmt Traffic Outbound"
		  filter_entry {
				entry_description	= "Allow All IP"
			filter_entry_name   	= "IPv4_and_IPv6"
				d_from_port        	= "unspecified"
				d_to_port        	= "unspecified"
				ether_t             = "ip"
				stateful			= "yes"  
		  }
		  filter_entry {
				entry_description   = "Allow icmp"
			filter_entry_name   	= "icmp"
				d_from_port        	= "unspecified"
				d_to_port        	= "unspecified"
				ether_t             = "ip"
				prot           		= "icmp"
		  }
		  filter_name  = "Mgmt_Out_Flt"
	}
}

/*
Create Subject and assign Filter and Contract
 - Tenants > mgmt > Contracts > Standard: [Contract Name]
 - Mgmt_In_Subj
 - Mgmt_Out_Subj
*/
resource "aci_contract_subject" "Mgmt_In_Subj" {
	contract_dn					 = aci_contract.mgmt_In_Ct.id
	name						 = "Mgmt_In_Subj"
	relation_vz_rs_subj_filt_att = ["uni/tn-mgmt/flt-Mgmt_In_Flt"]
	rev_flt_ports				 = "no"
}

resource "aci_contract_subject" "Mgmt_Out_Subj" {
	contract_dn					 = aci_contract.mgmt_Out_Ct.id
	name						 = "Mgmt_Out_Subj"
	relation_vz_rs_subj_filt_att = ["uni/tn-mgmt/flt-Mgmt_Out_Flt"]
	rev_flt_ports				 = "no"
}

/*
Assign the Contracts from above to the inb-default EPG
 - Tenants > mgmt > Application Profiles > inb_ap > Application EPGs > default > Contracts
 - Mgmt_In_Subj
 - Mgmt_Out_Subj
*/
resource "aci_epg_to_contract" "inb_default_provider" {
    application_epg_dn = aci_application_epg.inb_default.id
    contract_dn  = aci_contract.Mgmt_In_Ct.id
    contract_type = "provider"
}

resource "aci_epg_to_contract" "inb_default_consumer" {
    application_epg_dn = aci_application_epg.inb_default.id
    contract_dn  = aci_contract.Mgmt_Out_Ct.id
    contract_type = "consumer"
}

/*
Create the Contracts to be used by the Inband Management EPG
 - Tenants > mgmt > Contracts > Out-Of-Band Contracts: [Contract Name]
 - oob_mgmt_In_Ct
 - oob_mgmt_Out_Ct
*/
resource "aci_rest" "oob_mgmt_In_Ct" {
	path       = "/api/node/mo/uni/tn-mgmt/oobbrc-oob_mgmt_In_Ct.json"
	class_name = "vzOOBBrCP"
	payload    = <<EOF
{
	"vzOOBBrCP": {
		"attributes": {
			"dn": "uni/tn-mgmt/oobbrc-oob_mgmt_In_Ct",
			"name": "oob_mgmt_In_Ct",
			"scope": "tenant",
			"rn": "oobbrc-oob_mgmt_In_Ct"
		},
		"children": [
			{
				"vzSubj": {
					"attributes": {
						"dn": "uni/tn-mgmt/oobbrc-oob_mgmt_In_Ct/subj-oob_mgmt_In_Subj",
						"name": "oob_mgmt_In_Subj",
						"rn": "subj-oob_mgmt_In_Subj"
					},
					"children": [
						{
							"vzRsSubjFiltAtt": {
								"attributes": {
									"tnVzFilterName": "Mgmt_In_Flt"
								},
								"children": []
							}
						}
					]
				}
			}
		]
	}
}
	EOF
}

resource "aci_rest" "oob_mgmt_Out_Ct" {
	path       = "/api/node/mo/uni/tn-mgmt/oobbrc-oob_mgmt_Out_Ct.json"
	class_name = "vzOOBBrCP"
	payload    = <<EOF
{
	"vzOOBBrCP": {
		"attributes": {
			"dn": "uni/tn-mgmt/oobbrc-oob_mgmt_Out_Ct",
			"name": "oob_mgmt_Out_Ct",
			"scope": "tenant",
			"rn": "oobbrc-oob_mgmt_Out_Ct"
		},
		"children": [
			{
				"vzSubj": {
					"attributes": {
						"dn": "uni/tn-mgmt/oobbrc-oob_mgmt_Out_Ct/subj-oob_mgmt_Out_Subj",
						"name": "oob_mgmt_Out_Subj",
						"rn": "subj-oob_mgmt_Out_Subj"
					},
					"children": [
						{
							"vzRsSubjFiltAtt": {
								"attributes": {
									"tnVzFilterName": "Mgmt_Out_Flt"
								},
								"children": []
							}
						}
					]
				}
			}
		]
	}
}
	EOF
}

/*
Configure the Node Management EPGs Out-Of-Band EPG Policies
 - Tenants > mgmt > Node Management EPGs > Out-Of-Band EPG - default:
 	- Priority Level
 	- Provided Contract
*/
resource "aci_rest" "oob-default_mgmtOoB" {
	depends_on = [aci_rest.oob_mgmt_In_Ct]
	path       = "/api/node/mo/uni/tn-mgmt/mgmtp-default/oob-default.json"
	class_name = "mgmtOoB"
	payload    = <<EOF
{
	"mgmtOoB": {
		"attributes": {
			"dn": "uni/tn-mgmt/mgmtp-default/oob-default",
			"prio": "level1"
		},
		"children": [
			{
				"mgmtRsOoBProv": {
					"attributes": {
						"tnVzOOBBrCPName": "oob_mgmt_In_Ct",
						"prio": "level1",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

/*
Configure the Node Management EPGs InBand EPG Contracts
 - Tenants > mgmt > Node Management EPGs > In-Band EPG - default:
 	- Consumed Contract
 	- Provided Contract
*/
resource "aci_rest" "inb_epg_consumed" {
	depends_on = [aci_rest.inb_mgmt_default_epg,aci_rest.oob_mgmt_Out_Ct]
	path       = "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default.json"
	class_name = "fvRsCons"
	payload    = <<EOF
{
	"fvRsCons": {
		"attributes": {
			"tnVzBrCPName": "mgmt_Out_Ct",
			"prio": "level1"
		},
		"children": []
	}
}
	EOF
}

resource "aci_rest" "inb_epg_provided" {
	depends_on = [aci_rest.inb_mgmt_default_epg,aci_rest.oob_mgmt_Out_Ct]
	path       = "/api/node/mo/uni/tn-mgmt/mgmtp-default/inb-default.json"
	class_name = "fvRsProv"
	payload    = <<EOF
{
	"fvRsProv": {
		"attributes": {
			"tnVzBrCPName": "mgmt_In_Ct",
			"prio": "level1"
		},
		"children": []
	}
}
	EOF
}

/*
Configure External EPG for Out-Of-Band Network Instance
 - Tenants > mgmt > External Management Network Instance Profiles
 	- oob_ExtEpg
*/
resource "aci_rest" "oob-default_Ext_Inst" {
	depends_on = [aci_rest.inb_mgmt_default_epg,aci_rest.oob_mgmt_Out_Ct]
	path       = "/api/node/mo/uni/tn-mgmt/extmgmt-default/instp-oob_ExtEpg.json"
	class_name = "mgmtInstP"
	payload    = <<EOF
{
	"mgmtInstP": {
		"attributes": {
			"dn": "uni/tn-mgmt/extmgmt-default/instp-oob_ExtEpg",
			"name": "oob_ExtEpg",
			"rn": "instp-oob_ExtEpg",
		},
		"children": [
			{
				"mgmtSubnet": {
					"attributes": {
						"dn": "uni/tn-mgmt/extmgmt-default/instp-oob_ExtEpg/subnet-[0.0.0.0/0]",
						"ip": "0.0.0.0/0",
						"rn": "subnet-[0.0.0.0/0]",
					},
					"children": []
				}
			},
			{
				"mgmtRsOoBCons": {
					"attributes": {
						"tnVzOOBBrCPName": "oob_mgmt_Out_Ct",
						"prio": "level1",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}

/*
Assign the Default SNMP Monitoring Policy to the Mgmt VRF's
 - Tenants > mgmt > Networking > VRFs > [VRF Name]:Policy > Monitoring Policy
*/
resource "aci_rest" "inb_vrf_snmp" {
	path       = "/api/node/mo/uni/tn-mgmt/ctx-inb/rsCtxMonPol.json"
	class_name = "fvRsCtxMonPol"
	payload    = <<EOF
{
	"fvRsCtxMonPol": {
		"attributes": {
			"tnMonEPGPolName": "default",
		},
		"children": []
	}
}
	EOF
}

resource "aci_rest" "oob_vrf_snmp" {
	path       = "/api/node/mo/uni/tn-mgmt/ctx-oob/rsCtxMonPol.json"
	class_name = "fvRsCtxMonPol"
	payload    = <<EOF
{
	"fvRsCtxMonPol": {
		"attributes": {
			"tnMonEPGPolName": "default",
		},
		"children": []
	}
}
	EOF
}