
terraform {
  required_version = "= "
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

