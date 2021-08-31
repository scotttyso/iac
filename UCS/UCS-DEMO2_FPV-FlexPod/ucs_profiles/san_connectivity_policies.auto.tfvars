#______________________________________________
#
# SAN Connectivity Policies
#______________________________________________

san_connectivity_policies = {
  "TUTU_SCP" = {
    description          = ""
    organization         = "UCS-DEMO2_FPV-FlexPod"
    target_platform      = "FI-Attached"
    vhba_placement_mode  = "auto"
    wwnn_allocation_type = "pool"
    wwnn_static          = "20:00:00:25:B5:00:00:01"
    wwnn_pool            = ["DEMO"]
    tags = [
      {
        key = "easyucs_origin",
        value = "convert",
      },
      {
        key = "easyucs_version",
        value = "0.9.8",
      },
    ]
    vhbas = [
      {
        fibre_channel_adapter_policy = "default",
        fibre_channel_network_policy = "TUTU_SCP_vhba",
        fibre_channel_qos_policy     = "default",
        name                         = "vhba",
        pci_order                    = 1,
        slot_id                      = "MLOM",
        switch_id                    = "A",
        wwpn_allocation_type         = "pool",
        wwpn_pool                    = "DEMO-SAN-A",
      },
    ]
  }
}