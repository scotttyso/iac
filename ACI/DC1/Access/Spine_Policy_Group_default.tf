#------------------------------------------
# Create Spine Policy Group
#------------------------------------------

/*
API Information:
 - Class: "infraSpineAccNodePGrp"
 - Distinguished Name: "uni/infra/funcprof/spaccnodepgrp-default"
GUI Location:
 - Fabric > Access Policies > Switches > Spine Switches > Policy Groups: default

BFD IPv4 Policy
 - Class: "bfdIpv4InstPol"
 - Distinguished Name: "uni/infra/bfdIpv4Inst-default"
BFD IPv6 Policy
 - Class: "bfdIpv6InstPol"
 - Distinguished Name: "uni/infra/bfdIpv6Inst-default"
CDP Policy
 - Class: "cdpIfPol"
 - Distinguished Name: "uni/infra/cdpIfP-"
CoPP Pre-Filter
 - Class: "iaclLeafProfile"
 - Distinguished Name: "uni/infra/iaclleafp-default"
CoPP Spine Policy
 - Class: "coppSpineProfile"
 - Distinguished Name: "uni/infra/coppspinep-default"
LLDP Policy
 - Class: "lldpIfPol"
 - Distinguished Name: "uni/infra/lldpIfP-lldpEnabled"
*/
resource "aci_rest" "Spine_Policy_Group_default" {
    path        = "/api/node/mo/uni/infra/funcprof/spaccnodepgrp-default.json"
    class_name  = "infraSpineAccNodePGrp"
    payload     = <<EOF
{
    "infraSpineAccNodePGrp": {
        "attributes": {
            "dn": "uni/infra/funcprof/spaccnodepgrp-default",
            "descr": "Default Spine Policy Group",
            "name": "default"
        },
        "children": [
            {
                "infraRsSpineCoppProfile": {
                    "attributes": {
                        "tnCoppSpineProfileName": "default"
                    },
                    "children": []
                }
            },
            {
                "infraRsSpineBfdIpv4InstPol": {
                    "attributes": {
                        "tnBfdIpv4InstPolName": "default"
                    },
                    "children": []
                }
            },
            {
                "infraRsSpineBfdIpv6InstPol": {
                    "attributes": {
                        "tnBfdIpv6InstPolName": "default"
                    },
                    "children": []
                }
            },
            {
                "infraRsIaclSpineProfile": {
                    "attributes": {
                        "tnIaclSpineProfileName": "default"
                    },
                    "children": []
                }
            },
            {
                "infraRsSpinePGrpToCdpIfPol": {
                    "attributes": {
                        "tnCdpIfPolName": "cdpEnabled"
                    },
                    "children": []
                }
            },
            {
                "infraRsSpinePGrpToLldpIfPol": {
                    "attributes": {
                        "tnLldpIfPolName": "lldpEnabled"
                    },
                    "children": []
                }
            }
        ]
    }
}
    EOF
}

