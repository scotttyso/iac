#______________________________________________
#
# iSCSI Boot Policies
#______________________________________________

iscsi_boot_policies = {
  "iSCSI-Boot-A_iSCSI-Boot-A" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-A"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["iSCSI-Boot-A_iSCSI-Boot-A_1"]
    secondary_target_policy = ["iSCSI-Boot-A_iSCSI-Boot-A_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "iSCSI-Boot-A_iSCSI-Boot-B" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-B"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["iSCSI-Boot-A_iSCSI-Boot-B_1"]
    secondary_target_policy = ["iSCSI-Boot-A_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TEst_temp_iSCSI-Boot-A" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iscsi-initiator-pool"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["iSCSI-Boot-A_iSCSI-Boot-B_1"]
    secondary_target_policy = ["iSCSI-Boot-A_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TEst_temp_iSCSI-Boot-B" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iscsi-initiator-pool"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["iSCSI-Boot-A_iSCSI-Boot-B_1"]
    secondary_target_policy = ["iSCSI-Boot-A_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TestB_iSCSI-Boot-A" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-A"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["TestB_iSCSI-Boot-A_1"]
    secondary_target_policy = ["TestB_iSCSI-Boot-A_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TestB_iSCSI-Boot-B" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-B"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["TestB_iSCSI-Boot-B_1"]
    secondary_target_policy = ["TestB_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "testIscsi_iSCSI-Boot-A" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-A"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["testIscsi_iSCSI-Boot-A_1"]
    secondary_target_policy = ["testIscsi_iSCSI-Boot-A_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "testIscsi_iSCSI-Boot-B" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iSCSI-IP-Pool-B"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["testIscsi_iSCSI-Boot-B_1"]
    secondary_target_policy = ["testIscsi_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TUTU_iSCSI-Boot-A" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iscsi-initiator-pool"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["testIscsi_iSCSI-Boot-B_1"]
    secondary_target_policy = ["testIscsi_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
  "TUTU_iSCSI-Boot-B" = {
    description             = ""
    dhcp_vendor_id_iqn      = "CISCO_IBOOT"
    initiator_ip_source     = "Pool"
    ip_pool                 = ["iscsi-initiator-pool"]
    ip_address              = ""
    iscsi_adapter_policy    = ["default"]
    organization            = "UCS-DEMO2_FPV-FlexPod"
    primary_target_policy   = ["testIscsi_iSCSI-Boot-B_1"]
    secondary_target_policy = ["testIscsi_iSCSI-Boot-B_2"]
    target_source_type      = "Static"
    chap                    = []
    mutual_chap             = []
    initiator_static_ip_v4_config = []
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
  }
}