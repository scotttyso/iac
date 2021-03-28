/*
Create Pod Policy Group - default
API Information:
 - Class: "fabricPodPGrp"
 - Distinguished Name: " uni/tn-common/out-prod_l3out/lnodep-asgard-leaf101-102/lifp-asgard-leaf101-102-vl170/rspathL3OutAtt-[topology/pod-1/protpaths-101-102/pathep-[143-core_vpc]] "
GUI Location:
 - Fabric > Fabric Policies > Pods > Policy Groups: default
 - Assign all the default Policies to this Policy Group
*/
resource "aci_rest" "fabricPodPGrp" {
  path       = "/api/node/mo/uni/ uni/tn-common/out-prod_l3out/lnodep-asgard-leaf101-102/lifp-asgard-leaf101-102-vl170/rspathL3OutAtt-[topology/pod-1/protpaths-101-102/pathep-[143-core_vpc]] .json"
  class_name = "l3extRsPathL3OutAtt"
  payload    = <<EOF
{
    "l3extRsPathL3OutAtt": {
        "attributes": {
            "addr": "0.0.0.0",
            "annotation": "",
            "autostate": "disabled",
            "descr": "",
            "dn": " uni/tn-common/out-prod_l3out/lnodep-asgard-leaf101-102/lifp-asgard-leaf101-102-vl170/rspathL3OutAtt-[topology/pod-1/protpaths-101-102/pathep-[143-core_vpc]]",
            "encap": "vlan-170",
            "encapScope": "{{local}}",
            "ifInstT": "ext-svi",
            "ipv6Dad": "enabled",
            "llAddr": "::",
            "mac": "00:22:BD:F8:19:FF",
            "mode": "regular",
            "mtu": "{{mtu}}",
            "tDn": "topology/pod-1/protpaths-101-102/pathep-[143-core_vpc]",
            "targetDscp": "unspecified",
            "userdom": ":all:common:"
        },
        "children": [
            {
                "l3extMember": {
                    "attributes": {
                        "addr": "192.168.170.101/28",
                        "annotation": "",
                        "descr": "",
                        "ipv6Dad": "enabled",
                        "llAddr": "::",
                        "name": "",
                        "nameAlias": "",
                        "side": "A",
                    }
                }
            },
            {
                "l3extMember": {
                    "attributes": {
                        "addr": "192.168.170.102/28",
                        "annotation": "",
                        "descr": "",
                        "ipv6Dad": "enabled",
                        "llAddr": "::",
                        "name": "",
                        "nameAlias": "",
                        "side": "B",
                    }
                }
            },
        ]
    }
}
    EOF
}
