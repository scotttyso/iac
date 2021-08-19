policies_device_connector = {
  "default_devcon" = {
    description  = ""
    lockout      = "disabled"
    organization = "default"
    tags         = []
  }
}

policies_network_connectivity = {
  "default_dns" = {
    description = ""
    dns_server_v4 = [
      "172.20.1.244",
      "172.20.1.252",
    ]
    dns_server_v6 = []
    organization  = "default"
    tags          = []
    update_domain = ""
  }
}

#______________________________________________
#
# NTP Policies
#______________________________________________

policies_ntp = {
  "default_ntp" = {
    description  = ""
    enabled      = true
    ntp_servers  = [
      "ntp.ent.med.umich.edu",
    ]
    organization = "default"
    tags         = []
    timezone     = "America/Detroit"
  }
}

