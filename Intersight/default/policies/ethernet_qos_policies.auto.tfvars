#______________________________________________
#
# Ethernet QoS Policy Variables
#______________________________________________

ethernet_qos_policies = {
  "Asgard_mgmt" = {
    burst                 = 1024
    description           = "Asgard_mgmt Ethernet QoS Policy."
    enable_trust_host_cos = false
    priority              = "Silver"
    mtu                   = 9216
    organization          = "default"
    rate_limit            = 0
    tags                  = []
  }
  "Asgard_storage" = {
    burst                 = 1024
    description           = "Asgard_storage Ethernet QoS Policy."
    enable_trust_host_cos = false
    priority              = "Platinum"
    mtu                   = 9216
    organization          = "default"
    rate_limit            = 0
    tags                  = []
  }
}