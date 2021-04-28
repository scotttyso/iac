/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0995/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0995 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0995_phys-access_phys" {
    depends_on  = [aci_application_epg.nets_v0995]
    path        = "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0995.json"
    class_name  = "fvRsDomAtt"
    payload     = <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-access_phys"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0995/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0995 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0995_phys-access_phys" {
    depends_on  = [aci_application_epg.nets_v0995]
    path        = "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0995.json"
    class_name  = "fvRsDomAtt"
    payload     = <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-access_phys"
        },
        "children": []
    }
}
    EOF
}

/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0995/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0995 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0995_phys-access_phys" {
    depends_on  = [
        aci_application_epg.nets_v0995
    ]
    path        = "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0995.json"
    class_name  = "fvRsDomAtt"
    payload     = <<EOF
{
    "fvRsDomAtt": {
        "attributes": {
            "tDn": "uni/phys-access_phys"
        },
        "children": []
    }
}
    EOF
}

