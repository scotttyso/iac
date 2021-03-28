terraform {
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
      version = "0.1.5"
    }
  }
}

provider "mso" {
    # cisco-mso user name
	username    = var.msoUser
	password    = var.msoPass
    # cisco-mso url
    url         = "https://marvel-ase01.rich.ciscolabs.com/mso"
    domain      = "ISE"
    insecure    = true
}

data "mso_tenant" "prod" {
  name = "prod"
  display_name = "prod"
}

resource "mso_schema" "gmf_test" {
  name          = "gmf_test"
  template_name = "Asgard"
  tenant_id     = data.mso_tenant.prod.id
}
