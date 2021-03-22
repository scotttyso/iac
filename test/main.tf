terraform {
  required_version = "> 0.14"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">= 0.5.2"
    }
  }
}

provider "aci" {
	username    = var.aciUser
	password    = var.aciPass
	url         = var.aciUrl
	insecure    = true
}

data "aci_tenant" "prod" {
	name           = "prod"
}

resource "aci_application_profile" "networks" {
	depends_on 					= [data.aci_tenant.prod]
	tenant_dn					= data.aci_tenant.prod.id
	name						= "networks"
}

