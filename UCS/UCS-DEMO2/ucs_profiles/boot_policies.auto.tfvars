#______________________________________________
#
# Boot Order Policy Variables
#______________________________________________

boot_policies = {
  "CDROM-HDD-PXE" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      {
        bootloader_description = "UEFI Bootloader"
        bootloader_name        = "BOOTx64.EFI"
        bootloader_path        = "\\EFI\\BOOT\\"
        enabled                = true
        InterfaceName          = ""
        InterfaceSource        = ""
        IpType                 = ""
        lun                    = ""
        MacAddress             = ""
        name                   = "2"
        object_type            = "boot.LocalDisk"
        Port                   = null
        Slot                   = ""
        subtype                = ""
      },
      {
        enabled                = true
        InterfaceName          = "eth0"
        InterfaceSource        = "name"
        IpType                 = "IPv4"
        MacAddress             = ""
        name                   = "3_primary"
        object_type            = "boot.Pxe"
        Port                   = -1
        Slot                   = ""
        enabled               = true
      },
      {
        enabled                = true
        InterfaceName          = "eth0"
        InterfaceSource        = "name"
        IpType                 = "IPv4"
        MacAddress             = ""
        name                   = "3_secondary"
        object_type            = "boot.Pxe"
        Port                   = -1
        Slot                   = ""
      },
    ]
  }
  "default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
  "default-UEFI" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
  "diag" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
    ]
  }
  "Easy_ismayil" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName   = "eth0",
          InterfaceSource = "name",
          IpType          = "",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    ]
  }
  "FC" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName = "SAN-A",
          Lun           = 0,
          Port          = -1,
          Slot          = "",
          Wwpn          = "20:03:D0:39:EA:1D:32:89"
        }
        enabled               = true
        name                  = "2_primary_primary"
        object_type           = "boot.San"
      },
      {
        additional_properties = {
          InterfaceName = "SAN-A",
          Lun           = 0,
          Port          = -1,
          Slot          = "",
          Wwpn          = "20:04:D0:39:EA:1D:32:89"
        }
        enabled               = true
        name                  = "2_primary_secondary"
        object_type           = "boot.San"
      },
      {
        additional_properties = {
          InterfaceName = "SAN-B",
          Lun           = 0,
          Port          = -1,
          Slot          = "",
          Wwpn          = "20:01:D0:39:EA:1D:32:89"
        }
        enabled               = true
        name                  = "2_secondary_primary"
        object_type           = "boot.San"
      },
      {
        additional_properties = {
          InterfaceName = "SAN-B",
          Lun           = 0,
          Port          = -1,
          Slot          = "",
          Wwpn          = "20:02:D0:39:EA:1D:32:89"
        }
        enabled               = true
        name                  = "2_secondary_secondary"
        object_type           = "boot.San"
      },
      {
        additional_properties = { Subtype = "cimc-mapped-dvd" }
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    ]
  }
  "global-default" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
  "ipvtest" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName   = "",
          InterfaceSource = "name",
          IpType          = "IPv4",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    ]
  }
  "ISCSI" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName = "ISCSI-BOOT-A",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = {
          InterfaceName = "ISCSI-BOOT-B",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = { Subtype = "cimc-mapped-dvd" }
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    ]
  }
  "ISCSI-2" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName = "ISCSI-A",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = {
          InterfaceName = "ISCSI-B",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = { Subtype = "cimc-mapped-dvd" }
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    ]
  }
  "SDCard" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          Lun     = 0,
          Subtype = ""
        }
        enabled               = true
        name                  = "2"
        object_type           = "boot.SdCard"
      },
      {
        additional_properties = { Subtype = "cimc-mapped-dvd" }
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    ]
  }
  "testIscsi" = {
    boot_mode          = "Uefi"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          Bootloader = {
            ClassId     = "boot.Bootloader",
            Description = "UEFI Bootloader",
            Name        = "BOOTx64.EFI",
            ObjectType  = "boot.Bootloader",
            Path        = "\\EFI\\BOOT\\",
          },
          InterfaceName = "test",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
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
          InterfaceName = "toto",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
    ]
  }
  "utility" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName   = "default",
          InterfaceSource = "name",
          IpType          = "None",
          MacAddress      = "",
          Port            = -1,
          Slot            = ""
        }
        enabled               = true
        name                  = "1_primary"
        object_type           = "boot.Pxe"
      },
    ]
  }
  "VCF-iSCSI" = {
    boot_mode          = "Legacy"
    enable_secure_boot = false
    description        = ""
    organization       = "UCS-DEMO2"
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
          InterfaceName = "ETH2-BOOT-iSCSI",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_primary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = {
          InterfaceName = "ETH3-BOOT-iSCSI",
          Port          = -1,
          Slot          = ""
        }
        enabled               = true
        name                  = "2_secondary"
        object_type           = "boot.Iscsi"
      },
      {
        additional_properties = { Subtype = "cimc-mapped-dvd" }
        enabled               = true
        name                  = "3"
        object_type           = "boot.VirtualMedia"
      },
    ]
  }
}