#______________________________________________
#
# UCS Server Profile Variables
#______________________________________________

ucs_server_profiles = {
  "fpv-esxi-01" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "iSCSI-Boot-A"
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
  "fpv-esxi-02" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_FPV-FlexPod"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "iSCSI-Boot-A"
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
  "TUTU" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = "ESX"
    boot_order_policy             = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = "dff"
    lan_connectivity_policy       = "TUTU_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2_FPV-FlexPod"
    san_connectivity_policy       = "TUTU_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = "fdfdffd"
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = "KLK"
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