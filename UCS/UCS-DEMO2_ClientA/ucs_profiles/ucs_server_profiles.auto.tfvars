#______________________________________________
#
# UCS Server Profile Variables
#______________________________________________

ucs_server_profiles = {
  "ESX1" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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
  "ESX2" = {
    action                      = "No-op"
    assign_server               = false
    description                 = ""
    organization                = "UCS-DEMO2_ClientA"
    serial_number               = ""
    target_platform             = "FI-Attached"
    ucs_server_profile_template = "ESX"
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
  "test-easyucs-conversion-sp" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = "ESX"
    boot_policy                   = "CDROM-HDD-PXE"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = "ADMIN_inband"
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = "test-easyucs-conversion-sp_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2_ClientA"
    san_connectivity_policy       = "test-easyucs-conversion-sp_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = "test_writeable"
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
  "test-easyucs-static-wnnn" = {
    action                        = "No-op"
    assign_server                 = false
    bios_policy                   = ""
    boot_policy                   = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = ""
    ipmi_over_lan_policy          = ""
    lan_connectivity_policy       = ""
    local_user_policy             = ""
    organization                  = "UCS-DEMO2_ClientA"
    san_connectivity_policy       = "test-easyucs-static-wnnn_SCP"
    serial_number                 = ""
    sd_card_policy                = ""
    serial_over_lan_policy        = ""
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = ""
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