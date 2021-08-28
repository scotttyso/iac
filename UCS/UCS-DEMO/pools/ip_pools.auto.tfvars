#______________________________________________
#
# IP Pools
#______________________________________________

ip_pools = {
  "ext-mgmt" = {
    ipv4_block       = [
      {
        from = "10.60.0.111",
        to = "10.60.0.130",
      },
    ]
    ipv4_config      = [
      {
        gateway = "10.60.0.254",
        netmask = "255.255.255.0",
        primary_dns = "144.254.71.184",
      },
    ]
    ipv6_block       = []
    ipv6_config      = []
    organization     = "UCS-DEMO"
    tags             = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
  "iscsi-initiator-pool" = {
    ipv4_block       = [
      {
        from = "10.60.0.111",
        to = "10.60.0.130",
      },
    ]
    ipv4_config      = [
      {
        gateway = "10.60.0.254",
        netmask = "255.255.255.0",
        primary_dns = "144.254.71.184",
      },
    ]
    ipv6_block       = []
    ipv6_config      = []
    organization     = "UCS-DEMO"
    tags             = [
      {
        key   = "easyucs_origin",
        value = "convert"
      },
      {
        key   = "easyucs_version",
        value = "0.9.8"
      },
    ]
  }
}