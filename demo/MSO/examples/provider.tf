terraform {
  # Terraform Engine version
  required_version = ">=0.15.1"
  required_providers {
    mso = {
      # MSO Provider Source
      source = "CiscoDevNet/mso"
      # MSO Provider Version
      version = ">=0.1.5"
    }
  }
}

provider "mso" {
  # MSO URL for API Calls
  url = "https://${var.mso_hostname}/mso/"
  # Platform is either mso or nd
  # platform = "nd"
  # insecure is for self-signed certificates.  false if you have a public signed certificate installed for the webpage.
  insecure = true
  # MSO Username
  username = var.mso_user
  # MSO Password
  password = var.mso_password
  # MSO Login Domain.  Default is Local
  domain = var.mso_domain
}
