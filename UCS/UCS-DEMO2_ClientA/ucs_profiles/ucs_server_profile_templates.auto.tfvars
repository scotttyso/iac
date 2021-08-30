#______________________________________________
#
# UCS Server Profile Templates
#______________________________________________

ucs_server_profile_templates = {
  "ESX" = {
    bios_policy                   = "ESX"
    boot_policy                   = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = "ADMIN_inband"
    ipmi_over_lan_policy          = "IPMI-OSB3-DID"
    lan_connectivity_policy       = "ESX"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2_ClientA"
    san_connectivity_policy       = "ESX"
    sd_card_policy                = ""
    serial_over_lan_policy        = "SOL-ENABLE"
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = "ESXI7.0"
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
  "test-easyucs-conversion" = {
    bios_policy                   = "ESX"
    boot_policy                   = "default"
    certificate_management_policy = ""
    description                   = ""
    imc_access_policy             = "ADMIN_inband"
    ipmi_over_lan_policy          = "IPMI-OSB3-DID"
    lan_connectivity_policy       = "test-easyucs-conversion_LCP"
    local_user_policy             = ""
    organization                  = "UCS-DEMO2_ClientA"
    san_connectivity_policy       = "ESX"
    sd_card_policy                = ""
    serial_over_lan_policy        = "SOL-ENABLE"
    snmp_policy                   = ""
    storage_policy                = ""
    target_platform               = "FI-Attached"
    syslog_policy                 = ""
    virtual_kvm_policy            = "default"
    virtual_media_policy          = "ESXI7.0"
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