terraform {
  required_version = ">=0.14.5"

  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = "=1.0.5"
    }
  }
}

provider "aci" {
    username = var.apicUser
    password = var.apicPass
    url      = var.apicHost
    insecure = true
}

resource "aci_tenant" "tenant" {
  name        = "IKS_Demo"
  description = "Created with Terraform"

}

resource "aci_application_profile" "ap" {
  tenant_dn   = aci_tenant.tenant.id
  name        = "k8s"
  description = "Created with Terraform"
}

resource "aci_bridge_domain" "bridge_domain" {
        tenant_dn                   = aci_tenant.tenant.id
        description                 = "sample bridge domain"
        name                        = "iks_bd"
        relation_fv_rs_ctx = "uni/tn-common/ctx-wakanda"
        relation_fv_rs_bd_to_out = ["uni/tn-common/out-wakandaL3Out"]

}

resource "aci_subnet" "subnet" {
  parent_dn = aci_bridge_domain.bridge_domain.id
  ip = "10.139.191.1/24"
  preferred = "yes"
  scope = ["public"]
}

resource "aci_application_epg" "epg" {
    application_profile_dn  = aci_application_profile.ap.id
    name                    = "iks"
    relation_fv_rs_bd       = aci_bridge_domain.bridge_domain.id
    relation_fv_rs_prov = ["uni/tn-common/brc-default"]
    relation_fv_rs_cons = ["uni/tn-common/brc-default"]
}

resource "aci_epg_to_domain" "iks" {

  application_epg_dn    = aci_application_epg.epg.id
  tdn                   = "uni/vmmp-VMware/dom-panther"
  vmm_allow_promiscuous = "accept"
  vmm_forged_transmits  = "accept"
  vmm_mac_changes       = "accept"
  instr_imedcy = "immediate"
  res_imedcy = "immediate"
}
