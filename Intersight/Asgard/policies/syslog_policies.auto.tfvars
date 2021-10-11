#______________________________________________
#
# Syslog Policy Variables
#______________________________________________

syslog_policies = {
  "Asgard_syslog" = {
    description        = "Asgard_syslog Syslog Policy"
    local_min_severity = "warning"
    organization       = "Asgard"
    remote_clients    = [
      {
        enabled      = true
        hostname     = "lnx1.rich.ciscolabs.com"
        min_severity = "warning"
        port         = 514
        protocol     = "udp"
      },
    ]
    tags         = []
  }
}