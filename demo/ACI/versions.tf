terraform {
  required_version = "> 0.14"
  required_providers {
    aci = {
      source = "ciscodevnet/aci"
      version = "=0.5.4"
    }
  }
}
