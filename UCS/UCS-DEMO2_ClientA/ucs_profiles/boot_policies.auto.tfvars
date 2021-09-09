#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_ClientA"
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
  "CDROM-HDD-PXE" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2_ClientA"
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
        name                  = "2"
        object_type           = "boot.LocalDisk"
      },
      {
        additional_properties = {
          InterfaceName   = "eth0",
          InterfaceSource = "name",
          IpType          = "IPv4",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "3_primary"
        object_type           = "boot.Pxe"
      },
      {
        additional_properties = {
          InterfaceName   = "eth1",
          InterfaceSource = "name",
          IpType          = "",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "3_secondary"
        object_type           = "boot.Pxe"
      },
    ]
  }
}