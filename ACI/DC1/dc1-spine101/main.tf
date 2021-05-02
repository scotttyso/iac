
terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">= 0.5.4"
    }
  }
}

provider "aci" {
	username    = var.aciUser
	password    = var.aciPass
	url         = var.aciUrl
	insecure    = true
}

