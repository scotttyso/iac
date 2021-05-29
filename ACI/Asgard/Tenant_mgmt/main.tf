
terraform {
  required_version = ">= 0.15.4"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">= 0.7.0"
    }
  }
}

provider "aci" {
	username    = var.aciUser
	password    = var.aciPass
	url         = var.aciUrl
	insecure    = true
}

