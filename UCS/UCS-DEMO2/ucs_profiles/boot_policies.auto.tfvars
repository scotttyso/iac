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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2" = {
        enabled     = true
        name        = "2"
        object_type = "boot.LocalDisk"
        Slot        = ""
      },
      "3_primary" = {
        enabled         = true
        InterfaceName   = "eth0",
        InterfaceSource = "name",
        IpType          = "IPv4",
        MacAddress      = "",
        name            = "3_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3_secondary" = {
        enabled         = true
        InterfaceName   = "eth1",
        InterfaceSource = "name",
        IpType          = "",
        MacAddress      = "",
        name            = "3_secondary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalDisk"
        Slot        = ""
      },
      "2_primary" = {
        enabled         = true
        InterfaceName   = "default",
        InterfaceSource = "name",
        IpType          = "None",
        MacAddress      = "",
        name            = "2_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.LocalCdd"
      },
    }
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
    boot_devices = {
      "1" = {
        bootloader_description = "UEFI Bootloader",
        bootloader_name        = "BOOTx64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        name                   = "1"
        object_type            = "boot.LocalDisk"
        Slot                   = ""
      },
      "2_primary" = {
        enabled         = true
        InterfaceName   = "default",
        InterfaceSource = "name",
        IpType          = "None",
        MacAddress      = "",
        name            = "2_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.LocalCdd"
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
    }
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
    boot_devices = {
      "1_primary" = {
        enabled         = true
        InterfaceName   = "eth0",
        InterfaceSource = "name",
        IpType          = "",
        MacAddress      = "",
        name            = "1_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2_primary_primary" = {
        enabled       = true
        InterfaceName = "SAN-A",
        Lun           = 0,
        name          = "2_primary_primary"
        object_type   = "boot.San"
        Port          = -1,
        Slot          = "",
        Wwpn          = "20:03:D0:39:EA:1D:32:89"
      },
      "2_primary_secondary" = {
        enabled       = true
        InterfaceName = "SAN-A",
        Lun           = 0,
        name          = "2_primary_secondary"
        object_type   = "boot.San"
        Port          = -1,
        Slot          = "",
        Wwpn          = "20:04:D0:39:EA:1D:32:89"
      },
      "2_secondary_primary" = {
        enabled       = true
        InterfaceName = "SAN-B",
        Lun           = 0,
        name          = "2_secondary_primary"
        object_type   = "boot.San"
        Port          = -1,
        Slot          = "",
        Wwpn          = "20:01:D0:39:EA:1D:32:89"
      },
      "2_secondary_secondary" = {
        enabled       = true
        InterfaceName = "SAN-B",
        Lun           = 0,
        name          = "2_secondary_secondary"
        object_type   = "boot.San"
        Port          = -1,
        Slot          = "",
        Wwpn          = "20:02:D0:39:EA:1D:32:89"
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalDisk"
        Slot        = ""
      },
      "2_primary" = {
        enabled         = true
        InterfaceName   = "default",
        InterfaceSource = "name",
        IpType          = "None",
        MacAddress      = "",
        name            = "2_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.LocalCdd"
      },
    }
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
    boot_devices = {
      "1_primary" = {
        enabled         = true
        InterfaceName   = "",
        InterfaceSource = "name",
        IpType          = "IPv4",
        MacAddress      = "",
        name            = "1_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2_primary" = {
        enabled       = true
        InterfaceName = "ISCSI-BOOT-A",
        Port          = -1,
        name          = "2_primary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "2_secondary" = {
        enabled       = true
        InterfaceName = "ISCSI-BOOT-B",
        Port          = -1,
        name          = "2_secondary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2_primary" = {
        enabled       = true
        InterfaceName = "ISCSI-A",
        Port          = -1,
        name          = "2_primary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "2_secondary" = {
        enabled       = true
        InterfaceName = "ISCSI-B",
        Port          = -1,
        name          = "2_secondary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2" = {
        enabled     = true
        Lun         = 0,
        name        = "2"
        object_type = "boot.SdCard"
        Subtype     = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
    }
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
    boot_devices = {
      "1" = {
        bootloader_description = "UEFI Bootloader",
        bootloader_name        = "BOOTx64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        name                   = "1"
        object_type            = "boot.LocalDisk"
        Slot                   = ""
      },
      "2_primary" = {
        bootloader_description = "UEFI Bootloader",
        bootloader_name        = "BOOTx64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        InterfaceName          = "test",
        name                   = "2_primary"
        object_type            = "boot.Iscsi"
        Port                   = -1,
        Slot                   = ""
      },
      "2_secondary" = {
        bootloader_description = "UEFI Bootloader",
        bootloader_name        = "BOOTx64.EFI",
        bootloader_path        = "\\EFI\\BOOT\\",
        enabled                = true
        InterfaceName          = "toto",
        name                   = "2_secondary"
        object_type            = "boot.Iscsi"
        Port                   = -1,
        Slot                   = ""
      },
    }
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
    boot_devices = {
      "1_primary" = {
        enabled         = true
        InterfaceName   = "default",
        InterfaceSource = "name",
        IpType          = "None",
        MacAddress      = "",
        name            = "1_primary"
        object_type     = "boot.Pxe"
        Port            = -1,
        Slot            = ""
      },
    }
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
    boot_devices = {
      "1" = {
        enabled     = true
        name        = "1"
        object_type = "boot.LocalCdd"
      },
      "2_primary" = {
        enabled       = true
        InterfaceName = "ETH2-BOOT-iSCSI",
        Port          = -1,
        name          = "2_primary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "2_secondary" = {
        enabled       = true
        InterfaceName = "ETH3-BOOT-iSCSI",
        Port          = -1,
        name          = "2_secondary"
        object_type   = "boot.Iscsi"
        Slot          = ""
      },
      "3" = {
        enabled     = true
        name        = "3"
        object_type = "boot.VirtualMedia"
        Subtype     = "cimc-mapped-dvd"
      },
    }
  }
}