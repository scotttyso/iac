#______________________________________________
#
# Link Aggregation Policies
#______________________________________________

link_aggregation_policies = {
  "UCS-DEMO" = {
    description        = ""
    lacp_rate          = "normal"
    organization       = "UCS-DEMO"
    suspend_individual = False
    Tags               = [
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