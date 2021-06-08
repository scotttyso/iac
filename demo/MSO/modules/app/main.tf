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

resource "mso_schema_template_anp" "app_profile" {
  depends_on = [
    data.mso_schema.schema,
  ]
  display_name = var.app_list[count.index].app_profile
  name         = var.app_list[count.index].app_profile
  schema_id    = data.mso_schema.schema.id
  template     = var.template
  count        = length(var.app_list)
}
