/*
API Information:
 - Class: "dnsRsProfileToEpg"
 - Distinguished Name: "uni/fabric/dnsp-default"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: Management EPG
*/
resource "aci_rest" "DNS_Profile_default" {
    path        = "/api/node/mo/uni/fabric/dnsp-default.json"
    class_name  = "dnsProfile"
    payload     = <<EOF
{
    "dnsProfile": {
        "attributes": {
            "IPVerPreference": "IPv4",
            "descr": "System DNS Profile",
            "dn": "uni/fabric/dnsp-default",
            "name": "default"
        },
        "children": [
            {
                "dnsRsProfileToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
                    }
                }
            },
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[10.101.128.15]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "DNS_Profile_default_Server_10-101-128-15" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[10.101.128.15].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "10.101.128.15",
            "dn": "uni/fabric/dnsp-default/prov-[10.101.128.15]",
            "preferred": "no",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "dnsProv"
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[10.101.128.16]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "DNS_Profile_default_Server_10-101-128-16" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[10.101.128.16].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "10.101.128.16",
            "dn": "uni/fabric/dnsp-default/prov-[10.101.128.16]",
            "preferred": "yes",
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[rich.ciscolabs.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "DNS_Profile_default_Domain_rich-ciscolabs-com" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/dom-[rich.ciscolabs.com].json"
    class_name  = "dnsDomain"
    payload     = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[rich.ciscolabs.com]",
            "isDefault": "yes",
            "name": "rich.ciscolabs.com"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[cisco.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "DNS_Profile_default_Domain_cisco-com" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/dom-[cisco.com].json"
    class_name  = "dnsDomain"
    payload     = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[cisco.com]",
            "isDefault": "no",
            "name": "cisco.com"
        },
        "children": []
    }
}
    EOF
}

