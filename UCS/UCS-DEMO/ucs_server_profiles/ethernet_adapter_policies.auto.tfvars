#______________________________________________
#
# Ethernet (vNIC) Adapter Policies Policies
#______________________________________________

ethernet_adapter_policies = {
  "default" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "default-adapter-policy"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "global-default" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "default-adapter-policy"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Linux" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-linux"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Linux-NVMe-RoCE" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-NVMe-using-RDMA"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "MQ" = {
    completion_queue_count                   = 576
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-VM-Multi-Queue-Connection-with-no-RDMA"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 512
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 64
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "MQ-SMBd" = {
    completion_queue_count                   = 576
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-MultiQueue-with-RDMA"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 512
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 64
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "SMBClient" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-SMB-Client"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "SMBServer" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-SMB-server"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Solaris" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-Solaris"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "SRIOV" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-Win8-SRIOV-VMFEX-PF"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "usNIC" = {
    completion_queue_count                   = 12
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-usNIC-Connection"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 6
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 6
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 0
    tags         = [
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
  "usNICOracleRAC" = {
    completion_queue_count                   = 2000
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = True
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-usNIC-Oracle-RAC-Connection"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1000
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1000
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 0
    tags         = [
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
  "VMWare" = {
    completion_queue_count                   = 2
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-VMWare"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 1
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "VMWarePassThru" = {
    completion_queue_count                   = 8
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-VMWare-pass-thru--dynamic-vNIC-"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 4
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "WIN-AzureStack" = {
    completion_queue_count                   = 11
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = True
    description                              = "Recommended-adapter-settings-for-Azure-Stack"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 8
    receive_ring_size                        = 4096
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 3
    transmit_ring_size                       = 1024
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Win-HPN" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = True
    description                              = "Recommended-adapter-settings-for-Windows-high-performance-and-networking"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Win-HPN-SMBd" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = True
    description                              = "Recommended-adapter-settings-for-Windows-high-performance-and-networking-with-RoCE-V2"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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
  "Windows" = {
    completion_queue_count                   = 5
    completion_ring_size                     = 
    enable_advanced_filter                   = False
    enable_accelerated_receive_flow_steering = False
    enable_interrupt_scaling                 = False
    enable_geneve_offload                    = False
    enable_nvgre_offload                     = False
    enable_vxlan_offload                     = False
    description                              = "Recommended-adapter-settings-for-Windows"
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    interrupt_coalescing_type                = ""
    interrupt_mode                           = ""
    interrupt_timer                          = 
    interrupts                               = 
    organization                             = "UCS-DEMO"
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    roce_cos                                 = 
    roce_enable                              = 
    roce_memory_regions                      = 
    roce_queue_pairs                         = 
    roce_resource_groups                     = 
  
    roce_version                             = 1
  
    receive_side_scaling_enable              = 
    rss_enable_ipv4_hash                     = true
    rss_enable_ipv6_extensions_hash          = false
    rss_enable_ipv6_hash                     = true
    rss_enable_tcp_and_ipv4_hash             = true
    rss_enable_tcp_and_ipv6_extensions_hash  = false
    rss_enable_tcp_and_ipv6_hash             = true
    rss_enable_udp_and_ipv4_hash             = false
    rss_enable_udp_and_ipv6_hash             = false
    receive_queue_count                      = 4
    receive_ring_size                        = 512
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    tcp_offload_large_recieve                = 
    tcp_offload_large_send                   = 
    tcp_offload_rx_checksum                  = 
    tcp_offload_tx_checksum                  = 
    transmit_queue_count                     = 1
    transmit_ring_size                       = 256
    uplink_failback_timeout                  = 5
    tags         = [
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