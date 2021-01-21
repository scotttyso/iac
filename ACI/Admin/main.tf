  
terraform {
  required_version = "> 0.14"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">= 0.5.2"
    }
    mso = {
      source = "CiscoDevNet/mso"
      version = "0.1.4"
    }
  }
}

provider "aci" {
	username    = var.aciUser
	password    = var.aciPass
	url         = var.aciUrl
	insecure    = true
}

provider "mso" {
	username    = var.msoUser
	password    = var.msoPass
	url         = var.msoUrl
	insecure    = true
}