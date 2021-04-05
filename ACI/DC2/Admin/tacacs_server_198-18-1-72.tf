/*
API Information:
 - Class: "tacacsGroup"
 - Distinguished Name: "uni/fabric/tacacsgroup-default"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > default > [TACACS Destinations]
*/
resource "aci_rest" "tacacsGroup_default_198-18-1-72" {
    depends_on  = [tacacsGroup_default]
    path        = "/api/node/mo/uni/fabric/tacacsgroup-TACACS_acct/tacacsdest-198.18.1.72-port-49.json"
    class_name  = "tacacsTacacsDest"
    payload     = <<EOF
{
    "tacacsTacacsDest": {
        "attributes": {
            "dn": "uni/fabric/tacacsgroup-TACACS_acct/tacacsdest-198.18.1.72-port-49",
            "authProtocol": "pap",
            "host": "198.18.1.72",
            "key": "${var.TACACS_Secret1}",
            "rn": "tacacsdest-198.18.1.72-port-49"
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.Out-of-Band}"
                    }
                }
            }
        ]
    }
}
    EOF
}

/*
API Information:
 - Class: "aaaTacacsPlusProvider"
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-198.18.1.72"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "aaaTacacsPlusProvider_198-18-1-72" {
    path        = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-198.18.1.72.json"
    class_name    = "aaaTacacsPlusProvider"
    payload        = <<EOF
{
    "aaaTacacsPlusProvider": {
        "attributes": {
            "authProtocol": "pap",
            "descr": "2nd TACACS Server",
            "dn": "uni/userext/tacacsext/tacacsplusprovider-198.18.1.72",
            "key": "${var.TACACS_Secret1}",
            "monitorServer": "disabled",
            "name": "198.18.1.72",
            "port": "49",
            "retries": "5",
            "timeout": "5",
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
                    "attributes": {
                        "tDn": "${var.Out-of-Band}"
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
API Information:
 - Class: "aaaProviderRef"
 - Distinguished Name: "uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus/providerref-198.18.1.72"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_TACACS_prov-198-18-1-72" {
    depends_on  = [aci_rest.Login_Domain_TACACS_ISEplus,aci_rest.aaaTacacsPlusProvider_198-18-1-72]
    path        = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus/providerref-198.18.1.72.json"
    class_name    = "aaaProviderRef"
    payload        = <<EOF
{
    "aaaProviderRef": {
        "attributes": {
            "descr": "2nd TACACS Server",
            "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-ISEplus/providerref-198.18.1.72",
            "name": "198.18.1.72",
            "order": "2"
        },
        "children": []
    }
}
    EOF
}

