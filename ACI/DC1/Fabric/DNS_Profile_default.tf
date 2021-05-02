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
            "descr": "default DNS Profile",
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
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[198.18.1.51]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "DNS_Profile_default_Server_198-18-1-51" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[198.18.1.51].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "198.18.1.51",
            "dn": "uni/fabric/dnsp-default/prov-[198.18.1.51]",
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
 - Distinguished Name: "uni/fabric/dnsp-default/prov-[2001::1]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Providers
*/
resource "aci_rest" "DNS_Profile_default_Server_2001--1" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/prov-[2001::1].json"
    class_name  = "dnsProv"
    payload     = <<EOF
{
    "dnsProv": {
        "attributes": {
            "addr": "2001::1",
            "dn": "uni/fabric/dnsp-default/prov-[2001::1]",
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
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[sub.example.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "DNS_Profile_default_Domain_sub-example-com" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/dom-[sub.example.com].json"
    class_name  = "dnsDomain"
    payload     = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[sub.example.com]",
            "isDefault": "yes",
            "name": "sub.example.com"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "dnsDomain"
 - Distinguished Name: "uni/fabric/dnsp-default/dom-[example.com]"
GUI Location:
 - Fabric > Fabric Policies > Policies > Global > DNS Profiles > default: DNS Domains
*/
resource "aci_rest" "DNS_Profile_default_Domain_example-com" {
    depends_on  = [
        aci_rest.DNS_Profile_default
    ]
    path        = "/api/node/mo/uni/fabric/dnsp-default/dom-[example.com].json"
    class_name  = "dnsDomain"
    payload     = <<EOF
{
    "dnsDomain": {
        "attributes": {
            "dn": "uni/fabric/dnsp-default/dom-[example.com]",
            "isDefault": "no",
            "name": "example.com"
        },
        "children": []
    }
}
    EOF
}

