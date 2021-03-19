/*
API Information:
 - Class: "fvTenant"
 - Distinguished Name: "uni/tn-mgmt"
GUI Location:
 - Tenants > Create Tenant > mgmt
*/
data "aci_tenant" "mgmt" {
	name           = "mgmt"
}

/*
API Location:
 - Class: "fvAp"
 - Distinguished Name: "/uni/tn-mgmt/ap-inb_app"
GUI Location:
 - Tenants > mgmt > Application Profiles > inb_app
*/
data "aci_application_profile" "mgmt_inb_ap" {
  tenant_dn  = data.aci_tenant.mgmt.id
  name       = "inb_ap"
}

/*
API Information:
 - Class: "fvAEPg"
 - Distinguished Name: /uni/tn-mgmt/ap-inb_app/epg-default
GUI Location:
Tenants > mgmt > Application Profiles > inb_app > Application EPGs > default
*/
data "aci_application_epg" "mgmt_inb_ap_default" {
    application_profile_dn  = data.aci_application_profile.mgmt_inb_ap.id
    name                    = "default"
}