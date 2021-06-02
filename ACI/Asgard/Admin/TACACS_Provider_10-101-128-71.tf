/*
API Information:
 - Class: "tacacsTacacsDest"
 - Distinguished Name: "uni/fabric/tacacsgroup-default/tacacsdest-10.101.128.71-port-49"
GUI Location:
 - Admin > External Data Collectors > Monitoring Destinations > TACACS > default > [TACACS Destinations]
*/
resource "aci_rest" "TACACS_Accounting_DestGrp_default_Server_10-101-128-71" {
    depends_on  = [
        aci_rest.TACACS_Accounting_DestGrp_default
    ]
    path        = "/api/node/mo/uni/fabric/tacacsgroup-default/tacacsdest-10.101.128.71-port-49.json"
    class_name  = "tacacsTacacsDest"
    payload     = <<EOF
{
    "tacacsTacacsDest": {
        "attributes": {
            "dn": "uni/fabric/tacacsgroup-default/tacacsdest-10.101.128.71-port-49",
            "authProtocol": "pap",
            "host": "10.101.128.71",
            "key": "${var.TACACS_Secret1}",
            "rn": "tacacsdest-10.101.128.71-port-49"
        },
        "children": [
            {
                "fileRsARemoteHostToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
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
 - Distinguished Name: "userext/tacacsext/tacacsplusprovider-10.101.128.71"
GUI Location:
 - Admin > AAA > Authentication:TACACS > Create TACACS Provider
*/
resource "aci_rest" "TACACS_Provider_10-101-128-71" {
    path        = "/api/node/mo/uni/userext/tacacsext/tacacsplusprovider-10.101.128.71.json"
    class_name    = "aaaTacacsPlusProvider"
    payload        = <<EOF
{
    "aaaTacacsPlusProvider": {
        "attributes": {
            "authProtocol": "pap",
            "descr": "ise01.rich.ciscolabs.com",
            "dn": "uni/userext/tacacsext/tacacsplusprovider-10.101.128.71",
            "key": "${var.TACACS_Secret1}",
            "monitorServer": "disabled",
            "name": "10.101.128.71",
            "port": "49",
            "retries": "5",
            "timeout": "5",
        },
        "children": [
            {
                "aaaRsSecProvToEpg": {
                    "attributes": {
                        "tDn": "${var.out_of_band}"
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
 - Distinguished Name: "uni/userext/tacacsext/tacacsplusprovidergroup-RICH/providerref-10.101.128.71"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Login_Domain_RICH_TACACS_Provider_10-101-128-71" {
    depends_on  = [
        aci_rest.TACACS_Provider_10-101-128-71
    ]
	path		= "/api/node/mo/uni/userext.json"
	class_name	= "aaaUserEp"
	payload		= <<EOF
{
    "aaaUserEp": {
        "attributes": {
            "dn": "uni/userext"
        },
        "children": [
            {
                "aaaLoginDomain": {
                    "attributes": {
                        "dn": "uni/userext/logindomain-RICH",
                        "name": "RICH",
                    },
                    "children": [
                        {
                            "aaaDomainAuth": {
                                "attributes": {
                                    "dn": "uni/userext/logindomain-RICH/domainauth",
                                    "providerGroup": "RICH",
                                    "realm": "tacacs",
                                    "descr": "TACACS Login Domain",
                                },
                                "children": []
                            }
                        }
                    ]
                }
            },
            {
                "aaaTacacsPlusEp": {
                    "attributes": {
                        "dn": "uni/userext/tacacsext"
                    },
                    "children": [
                        {
                            "aaaTacacsPlusProviderGroup": {
                                "attributes": {
                                    "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-RICH"
                                },
                                "children": [
                                    {
                                        "aaaProviderRef": {
                                            "attributes": {
                                                "dn": "uni/userext/tacacsext/tacacsplusprovidergroup-RICH/providerref-10.101.128.71",
                                                "descr": "ise01.rich.ciscolabs.com",
                                                "name": "10.101.128.71",
                                                "order": "1"
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
        ]
    }
}
	EOF
}

