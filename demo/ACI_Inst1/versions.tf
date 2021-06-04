terraform {
  required_version = ">=0.15.1"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = ">=0.7.0"
    }
  }
}
