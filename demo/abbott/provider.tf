terraform {
  required_providers {
    aci = {
      source = "CiscoDevNet/aci"
      version = "2.0.0"
    }
  }
}

provider "aci" {
  password    = "cisco123"
  url         = "64.14.100.15"
  username    = "admin"
  insecure    = true
}