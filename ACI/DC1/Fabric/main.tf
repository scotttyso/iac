
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

