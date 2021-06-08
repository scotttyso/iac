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

resource "mso_schema_template_anp_epg" "anp_epg" {
  depends_on = [
    data.mso_schema.schema
  ]
  anp_name                   = var.epg_list[count.index].app_profile
  bd_name                    = var.epg_list[count.index].bridge_domain
  bd_schema_id               = data.mso_schema.schema.id
  bd_template_name           = var.epg_list[count.index].bridge_domain
  display_name               = var.epg_list[count.index].epg
  intra_epg                  = "unenforced"
  intersite_multicast_source = false
  name                       = var.epg_list[count.index].epg
  preferred_group            = false
  schema_id                  = data.mso_schema.schema.id
  template_name              = var.template
  useg_epg                   = false
  vrf_name                   = var.vrf_name
  vrf_schema_id              = data.mso_schema.schema.id
  vrf_template_name          = var.template
  count                      = length(var.epg_list)
}

resource "mso_schema_template_anp_epg_contract" "epg_contract_consumer" {
  depends_on = [
    data.mso_schema.schema,
    mso_schema_template_anp_epg.anp_epg
  ]
  anp_name           = var.epg_list[count.index].app_profile
  contract_name      = var.epg_list[count.index].contract_consumer
  contract_schema_id = data.mso_schema.schema.id
  epg_name           = var.epg_list[count.index].epg
  relationship_type  = "consumer"
  schema_id          = data.mso_schema.schema.id
  template_name      = var.template
  count              = length(var.epg_list)
}

resource "mso_schema_template_anp_epg_contract" "epg_contract_provider" {
  depends_on = [
    data.mso_schema.schema,
    mso_schema_template_anp_epg.anp_epg
  ]
  anp_name           = var.epg_list[count.index].app_profile
  contract_name      = var.epg_list[count.index].contract_provider
  contract_schema_id = data.mso_schema.schema.id
  epg_name           = var.epg_list[count.index].epg
  relationship_type  = "provider"
  schema_id          = data.mso_schema.schema.id
  template_name      = var.template
  count              = length(var.epg_list)
}
