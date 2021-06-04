terraform {
  required_version = ">=0.15.0"

  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">=1.0.7"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secret_key
  endpoint  = var.endpoint
}

module "terraform-intersight-iks" {
  source = "terraform-cisco-modules/iks/intersight//"
  # Infra Config Policy Information
  cluster_name = "Cloud_IaC_Inst1"
  cluster_action = "Deploy"
  vc_target_name   = var.vc_target_name
  vc_portgroup     = ["Cloud_IaC_Inst1|k8s|iks"]
  vc_datastore     = "NVMe_DS1"
  vc_cluster       = "Panther"
  vc_resource_pool = ""
  vc_password      = var.vc_password

  # IP Pool Information
  ip_starting_address = "10.96.131.100"
  ip_pool_size        = "20"
  ip_netmask          = "255.255.255.0"
  ip_gateway          = "10.96.131.1"
  ip_primary_dns      = "10.101.128.15"
  ip_secondary_dns    = "10.101.128.16"
  ip_primary_ntp      = "10.101.128.15"
  ip_secondary_ntp    = "10.101.128.16"

  # Network Configuration Settings
  # pod_cidr = "100.65.0.0/16"
  # service_cidr = "100.64.0.0/24"
  # cni = "Calico"
  domain_name         = "rich.ciscolabs.com"
  timezone            = "America/New_York"
  unsigned_registries = ["10.101.128.118"]
  # root_ca_registries  = [""]

  # Cluster information
  ssh_user     = var.ssh_user
  ssh_key      = var.ssh_key
  worker_size  = "small"
  worker_count = 4
  master_count = 1
  # Organization and Tag
  organization = var.organization
  tags         = var.tags
}
