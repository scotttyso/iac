#______________________________________________
#
# WWPN Pool Variables
#______________________________________________

wwpn_pools = {
  "Agard_A" = {
    assignment_order = "sequential"
    id_blocks        = [
      {
        from = "20:00:00:25:B5:0A:00:00"
        to = "20:00:00:25:B5:0A:02:00"
      },
    ]
    organization     = "default"
    pool_purpose     = "WWPN"
    tags             = []
  }
  "Agard_B" = {
    assignment_order = "sequential"
    id_blocks        = [
      {
        from = "20:00:00:25:B5:0B:00:00"
        to = "20:00:00:25:B5:0B:02:00"
      },
    ]
    organization     = "default"
    pool_purpose     = "WWPN"
    tags             = []
  }
}