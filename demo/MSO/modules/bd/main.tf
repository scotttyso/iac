data "mso_tenant" "tenant" {
  name         = var.tenant
  display_name = var.tenant
}

data "mso_schema" "schema" {
  depends_on = [
    data.mso_tenant.tenant
  ]
  name      = var.schema
  tenant_id = data.mso_tenant.tenant.id
}

resource "mso_schema_template_bd" "bridge_domain" {
  depends_on = [
    data.mso_schema.schema
  ]
  display_name           = var.bd_list[count.index].bridge_domain
  name                   = var.bd_list[count.index].bridge_domain
  intersite_bum_traffic  = var.bd_list[count.index].intersite_bum_traffic
  layer2_stretch         = var.bd_list[count.index].layer2_stretch
  layer2_unknown_unicast = var.bd_list[count.index].layer2_unknown_unicast
  layer3_multicast       = var.bd_list[count.index].layer3_multicast
  optimize_wan_bandwidth = var.bd_list[count.index].optimize_wan_bandwidth
  schema_id              = data.mso_schema.schema.id
  template_name          = var.template
  vrf_name               = var.vrf_name
  vrf_schema_id          = data.mso_schema.schema.id
  vrf_template_name      = var.template
  count                  = length(var.bd_list)
}

