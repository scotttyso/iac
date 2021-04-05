
terraform {
  required_version = "= 0.14.9"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">= 0.5.4"
    }
  }
}

provider "aci" {
	private_key = var.aciPrivateKey
	cert_name   = var.aciCertName
	url         = var.aciUrl
	insecure    = true
}

