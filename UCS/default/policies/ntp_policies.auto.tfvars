#______________________________________________
#
# NTP Policy Variables
#______________________________________________

ntp_policies = {
  "default_ntp" = {
    description  = "default NTP Policy."
    enabled      = true
    organization = "default"
    timezone     = "Etc/GMT"
    ntp_servers = [
      "0.north-america.pool.ntp.org",
    ]
    tags         = []
  }
}