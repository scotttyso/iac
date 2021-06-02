provider "mso" {
    # cisco-mso user name
    username = "admin"
    # cisco-mso password
    password = "password"
    # cisco-mso url
    url      = "https://173.36.219.193/"
    domain   = "domain-name"
    insecure = true
}

data "mso_tenant" "tenant" {
    name            = var.tenant
    display_name    = var.tenant
}

data "mso_schema" "schema" {
    name            = var.schema
}

data "mso_template" "template" {
    depends_on      = [
        mso_schema.schema
    ]
    name            = var.template
    schema_id       = data.mso_schema.schema.id
}

resource "mso_schema_template_anp" "app_profile" {
    depends_on      = [
        data.mso_schema.schema,
        data.mso_template.template
    ]
    schema_id       = data.mso_schema.schema.id
    template        = var.template
    name            = var.app_profile
    display_name    = var.app_profile
}

resource "mso_schema_template_anp_epg" "anp_epg" {
    depends_on                  = [
        data.mso_schema.schema,
        data.mso_template.template,
        mso_schema_template_anp.app_profile
    ]
    schema_id                   = data.mso_schema.schema.id
    template_name               = var.template
    anp_name                    = var.app_profile
    bd_name                     = var.bridge_domain
    display_name                = var.epg
    name                        = var.epg
    vrf_name                    = var.vrf
    useg_epg                    = false
    intra_epg                   = "unenforced"
    intersite_multicast_source  = false
    preferred_group             = false
}

