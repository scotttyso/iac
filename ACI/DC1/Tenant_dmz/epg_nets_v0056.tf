/*
API Information:
 - Class: "fvRsDomAtt"
 - Distinguished Name: /uni/tn-dmz/ap-nets/epg-v0056/rsdomAtt-[uni/phys-access_phys]
GUI Location:
Tenants > dmz > Application Profiles > nets > Application EPGs > v0056 > Domains (VMs and Bare-Metals)
*/
resource "aci_rest" "nets_v0056_phys-access_phys" {
    depends_on  = [aci_application_epg.nets_v0056]
    path        = "/api/node/mo/uni/tn-dmz/ap-nets/epg-v0056.json"
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
