#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "LOCAL" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_CAGIP"
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
    ]
  }
  "LOCAL-PXE" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_CAGIP"
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
          InterfaceName   = "",
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
    ]
  }
}