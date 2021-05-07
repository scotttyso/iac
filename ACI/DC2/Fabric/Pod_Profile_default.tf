/*
- This Resource File will create Recommended Default Policies for Fabric > Fabric Policies
- Need the vars_Fabric_Fabric_Policies.tf File for Variable Definitions
*/

/*
API Information:
 - Class: "fabricPodPGrp"
 - Distinguished Name: "uni/fabric/funcprof/podpgrp-default"
GUI Location:
 - Fabric > Fabric Policies > Pods > Policy Groups: default
*/
resource "aci_rest" "Fabric_Pod_Policy_Group_default" {
    path       = "/api/node/mo/uni/fabric/funcprof/podpgrp-default.json"
    class_name = "fabricPodPGrp"
    payload    = <<EOF
{
    "fabricPodPGrp": {
        "attributes": {
            "descr": "Configured using Terraform ACI Provider Deployment Script",
            "dn": "uni/fabric/funcprof/podpgrp-default",
            "name": "default"
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
resource "aci_rest" "Pod_Profile_default" {
    depends_on  = [
        aci_rest.Fabric_Pod_Policy_Group_default
    ]
    path        = "/api/node/mo/uni/fabric/podprof-default/pods-default-typ-ALL/rspodPGrp.json"
    class_name  = "fabricRsPodPGrp"
    payload     = <<EOF
{
    "fabricRsPodPGrp": {
        "attributes": {
            "tDn": "uni/fabric/funcprof/podpgrp-default",
        },
        "children": []
    }
}
    EOF
}


