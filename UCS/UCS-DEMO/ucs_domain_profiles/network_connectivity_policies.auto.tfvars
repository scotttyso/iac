#______________________________________________
#
# Network Connectivity (DNS) Policies
#______________________________________________

network_connectivity_policies = {
  "UCS-DEMO" = {
    description        = ""
    dns_server_v4      = [
      "144.254.71.184",
      ""
    ]
    enable_dynamic_dns = false
    obtain_ipv4_dns_from_dhcp = false
    organization       = "UCS-DEMO"
    tags               = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    update_domain      = ""
  }
}