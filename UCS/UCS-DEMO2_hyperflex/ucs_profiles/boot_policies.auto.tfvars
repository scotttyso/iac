#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "hx-compute" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = "Recommended-boot-policy-for-HyperFlex-servers"
    organization       = "UCS-DEMO2_hyperflex"
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
    boot_devices = {
      "1" = {
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.LocalDisk"
      },
    }
  }
  "hx-compute-m5" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = "Recommended-boot-policy-for-HyperFlex-servers"
    organization       = "UCS-DEMO2_hyperflex"
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
    boot_devices = {
      "1" = {
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.LocalDisk"
      },
    }
  }
  "HyperFlex" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = "Recommended-boot-policy-for-HyperFlex-servers"
    organization       = "UCS-DEMO2_hyperflex"
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
    boot_devices = {
      "1" = {
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Lun     = 0,
            Subtype = ""
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.SdCard"
      },
    }
  }
  "HyperFlex-m5" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = "Recommended-boot-policy-for-HyperFlex-servers"
    organization       = "UCS-DEMO2_hyperflex"
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
    boot_devices = {
      "1" = {
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      "2" = {
        additional_properties = jsonencode(
          {
            Bootloader = {
              ClassId     = "boot.Bootloader",
              Description = "UEFI Bootloader",
              Name        = "BOOTx64.EFI",
              ObjectType  = "boot.Bootloader",
              Path        = "\\EFI\\BOOT\\",
            },
            Slot = "MLOM"
          }
        )
        enabled               = true
        name                  = "2"
        object_type           = "boot.LocalDisk"
      },
    }
  }
}