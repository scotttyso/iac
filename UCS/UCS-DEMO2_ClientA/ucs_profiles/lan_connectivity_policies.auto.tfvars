#______________________________________________
#
# LAN Connectivity Policies
#______________________________________________

lan_connectivity_policies = {
  "ESX" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_ClientA"
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
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ESX_vmdata1-gold",
        ethernet_qos_policy             = "5Gb-platinum",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "vmdata1-gold",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ESX_vmdata2-gold",
        ethernet_qos_policy             = "5Gb-platinum",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "vmdata2-gold",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ESX_vmdata3-bronze",
        ethernet_qos_policy             = "1Gb-bronze",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "vmdata3-bronze",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = false,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ESX_vmdata4-bronze",
        ethernet_qos_policy             = "1Gb-bronze",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "vmdata4-bronze",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_qos_policy             = "100Mb",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "vmkernel",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        cdn_source                      = "vnic",
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ESX_Vmotion",
        ethernet_qos_policy             = "5Gb-platinum_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "Vmotion",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
  "test-easyucs-conversion_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_ClientA"
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
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "ADMIN",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "eth0",
        pci_order                       = 1,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion_LCP_eth1",
        ethernet_qos_policy             = "5Gb-platinum",
        mac_address_allocation_type     = "static",
        mac_address_static              = "12:34:56:78:90:AB",
        name                            = "eth1",
        pci_order                       = 2,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion_LCP_eth3",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "static",
        mac_address_static              = "12:34:56:78:90:AB",
        name                            = "eth3",
        pci_order                       = 3,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion_LCP_eth4",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "eth4",
        pci_order                       = 4,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion_LCP_eth5",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "eth5",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = true,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion_LCP_eth6",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "eth6",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
    ]
  }
  "test-easyucs-conversion-sp_LCP" = {
    description                 = ""
    enable_azure_stack_host_qos = false
    iqn_allocation_type         = "None"
    iqn_pool                    = [""]
    iqn_static_identifier       = ""
    organization                = "UCS-DEMO2_ClientA"
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
        enable_failover                 = true,
        ethernet_adapter_policy         = "VMWare",
        ethernet_network_control_policy = "CDP-LLDP-ENABLE",
        ethernet_network_group_policy   = "test-easyucs-conversion-sp_LCP_eth0",
        ethernet_qos_policy             = "100Mb",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["DEMO"],
        name                            = "eth0",
        pci_order                       = 5,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "Solaris",
        ethernet_network_control_policy = "CDP-enable",
        ethernet_network_group_policy   = "ADMIN",
        ethernet_qos_policy             = "1Gb-bronze",
        mac_address_allocation_type     = "pool",
        mac_address_pool                = ["ESX"],
        name                            = "eth1",
        pci_order                       = 6,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
      {
        enable_failover                 = false,
        ethernet_adapter_policy         = "TestAzureGeneve",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion-sp_LCP_eth2",
        ethernet_qos_policy             = "default_mtu9000",
        mac_address_allocation_type     = "static",
        mac_address_static              = "12:34:56:78:90:AB",
        name                            = "eth2",
        pci_order                       = 7,
        slot_id                         = "MLOM",
        switch_id                       = "A",
      },
      {
        enable_failover                 = true,
        ethernet_adapter_policy         = "default",
        ethernet_network_control_policy = "default",
        ethernet_network_group_policy   = "test-easyucs-conversion-sp_LCP_eth3",
        ethernet_qos_policy             = "default",
        mac_address_allocation_type     = "static",
        mac_address_static              = "12:34:56:78:90:AB",
        name                            = "eth3",
        pci_order                       = 8,
        slot_id                         = "MLOM",
        switch_id                       = "B",
      },
    ]
  }
}