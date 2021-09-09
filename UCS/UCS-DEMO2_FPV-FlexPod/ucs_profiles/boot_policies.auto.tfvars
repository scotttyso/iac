#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "iSCSI-Boot" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_FPV-FlexPod"
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
    boot_devices = [
      {
        additional_properties = ""
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalCdd"
      },
      {
        additional_properties = {
          InterfaceName = "iSCSI-Boot-A",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = {
          InterfaceName = "iSCSI-Boot-B",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
    ]
  }
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_FPV-FlexPod"
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
    boot_devices = [
      {
        additional_properties = {
          Bootloader = {
            ClassId     = "boot.Bootloader",
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader",
            Path        = "\\EFI\\BOOT\\",
          },
          Slot = ""
        }
        enabled               = true
        name                  = "1"
        object_type           = "boot.LocalDisk"
      },
      {
        additional_properties = {
          InterfaceName   = "default",
          InterfaceSource = "name",
          IpType          = "None",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Pxe"
      },
      {
        additional_properties = ""
        enabled               = true
        name                  = "3"
        object_type           = "boot.LocalCdd"
      },
    ]
  }
}