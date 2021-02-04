/*
- This Resource File will create Recommended Default Policies for Fabric > Fabric Policies
- Need the vars_Fabric_Fabric_Policies.tf File for Variable Definitions
*/

/*
Create Pod Policy Group - default
API Information:
 - Class: "fabricPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-default"
GUI Location:
 - Fabric > Fabric Policies > Pods > Policy Groups: default
 - Assign all the default Policies to this Policy Group
*/
resource "aci_rest" "fabricPodPGrp" {
  path       = "/api/node/mo/uni/fabric/funcprof/podpgrp-default.json"
  class_name = "fabricPodPGrp"
  payload    = <<EOF
{
	"fabricPodPGrp": {
		"attributes": {
			"dn": "uni/fabric/funcprof/podpgrp-default",
			"name": "default",
			"descr": "Configured using Terraform ACI Provider Deployment Script",
			"rn": "podpgrp-default"
		},
		"children": [
			{
				"fabricRsTimePol": {
					"attributes": {
						"tnDatetimePolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpIsisDomP": {
					"attributes": {
						"tnIsisDomPolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpCoopP": {
					"attributes": {
						"tnCoopPolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsPodPGrpBGPRRP": {
					"attributes": {
						"tnBgpInstPolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsCommPol": {
					"attributes": {
						"tnCommPolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsSnmpPol": {
					"attributes": {
						"tnSnmpPolName": "default"
					},
					"children": []
				}
			},
			{
				"fabricRsMacsecPol": {
					"attributes": {
						"tnMacsecFabIfPolName": "default"
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
Assign the Pod Policy Group - default - to the default Pod Profile
API Information:
 - Class: "fabricRsPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-default"
GUI Location:
 - Fabric > Fabric Policies > Pods > Profiles > Pod Profile default
 - Assign Pod Policy Group to the Profile
*/
resource "aci_rest" "fabricRsPodPGrp" {
  path       = "/api/node/mo/uni/fabric/podprof-default/pods-default-typ-ALL/rspodPGrp.json"
  class_name = "fabricRsPodPGrp"
  payload    = <<EOF
{
	"fabricRsPodPGrp": {
		"attributes": {
			"tDn": "uni/fabric/funcprof/podpgrp-default",
			"status": "created"
		},
		"children": []
	}
}
	EOF
}

/*
Create SNMP Client Groups
 - Inband
 - Out-Of-Band
API Information:
 - Class: "snmpClientGrpP"
 - Distinguished Name: ""uni/fabric/snmppol-default/clgrp-${each.value.name}_Clients"
GUI Location:
 - Fabric > Fabric Policies > Policies > Pod > SNMP > default - {Client Group Policies}
*/
resource "aci_rest" "snmp_cg" {
  for_each   	= var.SNMP_ClntGrps
  path       	= "/api/node/mo/uni/fabric/snmppol-default/clgrp-${each.value.name}_Clients.json"
  class_name 	= "snmpClientGrpP"
  payload    	= <<EOF
{
	"snmpClientGrpP": {
		"attributes": {
			"dn": "uni/fabric/snmppol-default/clgrp-${each.value.name}_Clients",
			"name": "${each.value.name}_Clients",
			"descr": "SNMP Clients allowed on ${each.value.name} Mgmt",
			"rn": "clgrp-${each.value.name}_Clients",
			"status": "created"
		},
		"children": [
			{
				"snmpRsEpg": {
					"attributes": {
						"tDn": "uni/tn-mgmt/mgmtp-default/${each.value.epg}",
						"status": "created"
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
Create SNMP Source and SNMP Trap Destination Group
API Information:
 - Class: "snmpSrc"
 - Distinguished Name: "uni/fabric/moncommon/snmpsrc-SNMP_Src"
GUI Location:
 - Fabric > Fabric Policies > Policies > Monitoring > Common Policy > Callhome/Smart Callhome/SNMP/Syslog/TACACS: SNMP
*/
resource "aci_rest" "snmp_trap_Src" {
	path       = "/api/node/mo/uni/fabric/moncommon/snmpsrc-SNMP_Src.json"
	class_name = "snmpSrc"
	payload    = <<EOF
{
	"snmpSrc": {
		"attributes": {
			"dn": "uni/fabric/moncommon/snmpsrc-SNMP_Src",
			"incl": "audits,events,faults",
			"name": "SNMP_Src",
			"rn": "snmpsrc-SNMP_Src",
		},
		"children": [
			{
				"snmpRsDestGroup": {
					"attributes": {
						"tDn": "uni/fabric/snmpgroup-SNMP-TRAP_dg",
					},
					"children": []
				}
			}
		]
	}
}
	EOF
}