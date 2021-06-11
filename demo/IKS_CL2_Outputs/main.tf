terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = ">=1.0.9"
    }
  }
}

provider "intersight" {
  apikey    = var.api_key
  secretkey = var.secret_key
  endpoint  = var.endpoint
}


locals {
    kube_config = yamldecode(base64decode(data.intersight_kubernetes_cluster.workshop.results[0].kube_config))
}

data "intersight_kubernetes_cluster" "workshop" {
    name = "cloud-iac-cl1"
}

output "kube_config" {
    value = base64decode(data.intersight_kubernetes_cluster.workshop.results[0].kube_config)
}

output "url" {
    value = local.kube_config.clusters[0].cluster.server
}

output "hostname" {
    value = trimsuffix(trimprefix(local.kube_config.clusters[0].cluster.server, "https://"), regex("[:]\\d+", trimprefix(local.kube_config.clusters[0].cluster.server, "https://")))
}

output "certificate-authority-data" {
    value = local.kube_config.clusters[0].cluster.certificate-authority-data
}

output "client-certificate-data" {
    value = local.kube_config.users[0].user.client-certificate-data
}

output "client-key-data" {
    value = local.kube_config.users[0].user.client-key-data
}
