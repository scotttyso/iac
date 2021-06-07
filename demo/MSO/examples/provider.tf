terraform {
  required_version = ">=0.15.1"
  required_providers {
    mso = {
      source = "CiscoDevNet/mso"
      version = ">=0.1.5"
    }
  }
}

provider "mso" {
    domain   = var.mso_domain
    insecure = true
    # cisco-mso password
    password = var.mso_password
    platform = "nd"
    # cisco-mso user name
    username = var.mso_user
    # cisco-mso url
    url      = "https://${var.mso_hostname}"
}
