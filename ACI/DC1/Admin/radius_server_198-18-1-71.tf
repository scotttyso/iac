/*
API Information:
 - Class: "aaaRadiusProvider"
 - Distinguished Name: "uni/userext/radiusext/radiusprovider-198.18.1.71"
GUI Location:
 - Admin > AAA > Authentication:RADIUS > Create RADIUS Provider
*/
resource "aci_rest" "aaaRadiusProvider_198-18-1-71" {
    path        = "/api/node/mo/uni/userext/radiusext/radiusprovider-198.18.1.71.json"
    class_name  = "aaaRadiusProvider"
    payload     = <<EOF
{
    "aaaRadiusProvider": {
        "attributes": {
            "authProtocol": "pap",
            "descr": "1st RADIUS Server",
            "dn": "uni/userext/radiusext/radiusprovider-198.18.1.71",
            "key": "${var.RADIUS_Secret1}",
            "monitorServer": "disabled",
            "name": "198.18.1.71",
            "port": "1812",
            "retries": "5",
            "timeout": "5"
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
 - Distinguished Name: "uni/userext/radiusext/radiusprovidergroup-ISE/providerref-198.18.1.71"
GUI Location:
 - Admin > AAA > Authentication:AAA > Login Domain
*/
resource "aci_rest" "Ext_Login_RADIUS_prov-198-18-1-71" {
    depends_on  = [aci_rest.aaaRadiusProvider_198-18-1-71]
    path        = "/api/node/mo/uni/userext/radiusext/radiusprovidergroup-ISE/providerref-198.18.1.71.json"
    class_name    = "aaaProviderRef"
    payload        = <<EOF
{
    "aaaProviderRef": {
        "attributes": {
            "descr": "1st RADIUS Server",
            "dn": "uni/userext/radiusext/radiusprovidergroup-ISE/providerref-198.18.1.71",
            "order": "1",
            "name": "198.18.1.71"
        }
    }
}
    EOF
}

