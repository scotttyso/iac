output "tenant" {
  value = aci_tenant.tenant.id
}

output "bridge_domain" {
  value = aci_bridge_domain.bridge_domain.id
}

output "subnet" {
  value = aci_subnet.subnet.id
}

output "ap" {
  value = aci_application_profile.ap.id
}

output "epg" {
  value = aci_application_epg.epg.id
}
