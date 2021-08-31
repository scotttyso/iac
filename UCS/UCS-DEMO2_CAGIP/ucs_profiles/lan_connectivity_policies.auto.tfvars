#______________________________________________
#
# LAN Connectivity Policies
#______________________________________________

lan_connectivity_policies = {
  "CEPH" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_CAGIP"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
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
    vnics = [
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "VG-ADMIN-SRV",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "ADMIN",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "CEPH_CEPH-BE",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "CEPH-BE",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "CEPH_CEPH-FE",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "CEPH-FE",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "CPTE" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_CAGIP"
    vnic_placement_mode         = "auto"
    target_platform             = "FI-Attached"
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
    vnics = [
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "VG-ADMIN-SRV",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "ADMIN",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "ADMIN-CLI-A",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "ADMIN-CLI-B",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "CPTE_CEPH-FE",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "CEPH-FE",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CACIB-A",
        pci_order                       = 12,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CACIB-B",
        pci_order                       = 13,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CAPS-A",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CAPS-B",
        pci_order                       = 9,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CATS-A",
        pci_order                       = 10,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-CATS-B",
        pci_order                       = 11,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "VG-SILCA",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-SILCA-A",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "VG-SILCA",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "LAN-SILCA-B",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "Linux",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "CPTE_OS-PRIVATE",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["MAC-OSB3-DID"],
        name                            = "OS-PRIVATE",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
}