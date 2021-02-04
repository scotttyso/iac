/*
CDP Policy Variables
*/
variable "policies_cdp" {
	default = {
		"Disabled" = {
			name        = "cdp_Disabled"
			admin_st    = "disabled"
		},
		"Enable" = {
			name        = "cdp_Enabled"
			admin_st    = "enabled"
		},
	}
}

/*
Interface Fibre-Channel Policy Variables
*/
variable "policies_int_fc" {
	default = {
		"4G_f_port" = {
			name        = "4G_f_port"
			port_mode	= "f"
			speed       = "4G"
			trunk_mode  = "auto"
		},
		"4G_f_trunk" = {
			name        = "4G_f_trunk"
			port_mode	= "f"
			speed       = "4G"
			trunk_mode  = "trunk-on"
		},
		"4G_np_port" = {
			name        = "4G_np_port"
			port_mode	= "np"
			speed       = "4G"
			trunk_mode  = "auto"
		},
		"4G_np_trunk" = {
			name        = "4G_np_trunk"
			port_mode	= "np"
			speed       = "4G"
			trunk_mode  = "trunk-on"
		},
		"8G_f_port" = {
			name        = "8G_f_port"
			port_mode	= "f"
			speed       = "8G"
			trunk_mode  = "auto"
		},
		"8G_f_trunk" = {
			name        = "8G_f_trunk"
			port_mode	= "f"
			speed       = "8G"
			trunk_mode  = "trunk-on"
		},
		"8G_np_port" = {
			name        = "8G_np_port"
			port_mode	= "np"
			speed       = "8G"
			trunk_mode  = "auto"
		},
		"8G_np_trunk" = {
			name        = "8G_np_trunk"
			port_mode	= "np"
			speed       = "8G"
			trunk_mode  = "trunk-on"
		},
		"16G_f_port" = {
			name        = "16G_f_port"
			port_mode	= "f"
			speed       = "16G"
			trunk_mode  = "auto"
		},
		"16G_f_trunk" = {
			name        = "16G_f_trunk"
			port_mode	= "f"
			speed       = "16G"
			trunk_mode  = "trunk-on"
		},
		"16G_np_port" = {
			name        = "16G_np_port"
			port_mode	= "np"
			speed       = "16G"
			trunk_mode  = "auto"
		},
		"16G_np_trunk" = {
			name        = "16G_np_trunk"
			port_mode	= "np"
			speed       = "16G"
			trunk_mode  = "trunk-on"
		},
		"32G_f_port" = {
			name        = "32G_f_port"
			port_mode	= "f"
			speed       = "32G"
			trunk_mode  = "auto"
		},
		"32G_f_trunk" = {
			name        = "32G_f_trunk"
			port_mode	= "f"
			speed       = "32G"
			trunk_mode  = "trunk-on"
		},
		"32G_np_port" = {
			name        = "32G_np_port"
			port_mode	= "np"
			speed       = "32G"
			trunk_mode  = "auto"
		},
		"32G_np_trunk" = {
			name        = "32G_np_trunk"
			port_mode	= "np"
			speed       = "32G"
			trunk_mode  = "trunk-on"
		},
	}
}

/*
LACP Policy Variables
*/
variable "policies_lacp" {
	default = {
		"Active" = {
			description = "Base LACP Policy; Mode Active"
			name        = "lacp_Active"
			mode        = "active"
		},
		"MacPin" = {
			description = "Base LACP Policy; Mode MAC Pinning"
			name        = "lacp_MacPin"
			mode        = "mac-pin"
		},
		"Passive" = {
			description = "Base LACP Policy; Mode Passive"
			name        = "lacp_Passive"
			mode        = "passive"
		},
		"Static" = {
			description = "Base LACP Policy; Mode Static"
			name        = "lacp_Static"
			mode        = "off"
		},
	}
}

/*
Link Level Policy Variables
*/
variable "policies_link_level" {
	default = {
		"100M_Auto" = {
			name        = "100M_Auto"
			description = "Base Interface Policy; 100M Auto"
			auto_neg    = "on"
			speed       = "100M"
		},
		"100M_noNeg" = {
			name        = "100M_noNeg"
			description = "Base Interface Policy; 100M No negotiate"
			auto_neg    = "off"
			speed       = "100M"
		},
		"1G_Auto" = {
			name        = "1G_Auto"
			description = "Base Interface Policy; 1G Auto"
			auto_neg    = "on"
			speed       = "1G"
		},
		"1G_noNeg" = {
			name        = "1G_noNeg"
			description = "Base Interface Policy; 1G No negotiate"
			auto_neg    = "off"
			speed       = "1G"
		},
		"10G_Auto" = {
			name        = "10G_Auto"
			description = "Base Interface Policy; 10G Auto"
			auto_neg    = "on"
			speed       = "10G"
		},
		"10G_noNeg" = {
			name        = "10G_noNeg"
			description = "Base Interface Policy; 10G No negotiate"
			auto_neg    = "off"
			speed       = "10G"
		},
		"25G_Auto" = {
			name        = "25G_Auto"
			description = "Base Interface Policy; 25G Auto"
			auto_neg    = "on"
			speed       = "25G"
		},
		"25G_noNeg" = {
			name        = "25G_noNeg"
			description = "Base Interface Policy; 25G No negotiate"
			auto_neg    = "off"
			speed       = "25G"
		},
		"40G_Auto" = {
			name        = "40G_Auto"
			description = "Base Interface Policy; 40G Auto"
			auto_neg    = "on"
			speed       = "40G"
		},
		"40G_noNeg" = {
			name        = "40G_noNeg"
			description = "Base Interface Policy; 40G No negotiate"
			auto_neg    = "off"
			speed       = "40G"
		},
		"50G_Auto" = {
			name        = "50G_Auto"
			description = "Base Interface Policy; 50G Auto"
			auto_neg    = "on"
			speed       = "50G"
		},
		"50G_noNeg" = {
			name        = "50G_noNeg"
			description = "Base Interface Policy; 50G No negotiate"
			auto_neg    = "off"
			speed       = "50G"
		},
		"100G_Auto" = {
			name        = "100G_Auto"
			description = "Base Interface Policy; 100G Auto"
			auto_neg    = "on"
			speed       = "100G"
		},
		"100G_noNeg" = {
			name        = "100G_noNeg"
			description = "Base Interface Policy; 100G No negotiate"
			auto_neg    = "off"
			speed       = "100G"
		},
		"200G_Auto" = {
			name        = "200G_Auto"
			description = "Base Interface Policy; 200G Auto"
			auto_neg    = "on"
			speed       = "200G"
		},
		"200G_noNeg" = {
			name        = "200G_noNeg"
			description = "Base Interface Policy; 200G No negotiate"
			auto_neg    = "off"
			speed       = "200G"
		},
		"400G_Auto" = {
			name        = "400G_Auto"
			description = "Base Interface Policy; 400G Auto"
			auto_neg    = "on"
			speed       = "400G"
		},
		"400G_noNeg" = {
			name        = "400G_noNeg"
			description = "Base Interface Policy; 400G No negotiate"
			auto_neg    = "off"
			speed       = "400G"
		},
		"inherit_Auto" = {
			name        = "inherit_Auto"
			description = "Base Interface Policy; Inherit Auto"
			auto_neg    = "on"
			speed       = "inherit"
		},
		"inherit_noNeg" = {
			name        = "inherit_noNeg"
			description = "Base Interface Policy; Inherit No negotiate"
			auto_neg    = "off"
			speed       = "inherit"
		},
	}
}

/*
LLDP Policy Variables
*/
variable "policies_lldp" {
	default = {
		"lldp_Disabled" = {
			description = "Base LLDP Policy; Disabled"
			name        = "lldp_Disabled"
			admin_rx_st = "disabled"
			admin_tx_st = "disabled"
		},
		"lldp_Enabled" = {
			description = "Base LLDP Policy; Enabled"
			name        = "lldp_Enabled"
			admin_rx_st = "enabled"
			admin_tx_st = "enabled"
		},
		"lldp_rx_Enabled" = {
			description = "Base LLDP Policy; Disabled"
			name        = "lldp_rx_Enabled"
			admin_rx_st = "enabled"
			admin_tx_st = "disabled"
		},
		"lldp_tx_Enabled" = {
			description = "Base LLDP Policy; Enabled"
			name        = "lldp_tx_Enabled"
			admin_rx_st = "disabled"
			admin_tx_st = "enabled"
		}
	}
}

/*
MCP Policy Variables
*/
variable "policies_mcp" {
	default = {
		"mcp_Disabled" = {
			description = "Base Miscabling Policy; Mode Disabled"
			name        = "mcp_Disabled"
			admin_st    = "disabled"
		},
		"mcp_Enabled" = {
			description = "Base LACP Policy; Mode Enabled"
			name        = "mcp_Enabled"
			admin_st    = "enabled"
		},
	}
}

/*
Spanning Tree Interface Policy Variables
*/
variable "policies_stp" {
	default = {
		"BPDU_ft" = {
			name        = "BPDU_ft"
			ctrl		= "bpdu-filter"
		},
		"BPDU_ft_and_gd" = {
			name        = "BPDU_ft_and_gd"
			ctrl		= "bpdu-filter,bpdu-guard"
		},
		"BPDU_gd" = {
			name        = "BPDU_gd"
			ctrl		= "bpdu-guard"
		},
		"BPDU_no_ft_or_gd" = {
			name        = "BPDU_no_ft_or_gd"
			ctrl		= ""
		}
	}
}

/*
Layer-3 Domain Profile Variables
*/
variable "profile_l3dom" {
	default = {
		"L3Out" = {
			name        = "L3Out"
			vl_pool		= "l3out"
		},
		"msite_L3" = {
			name        = "msite_L3"
			vl_pool		= "msite"
		},
	}
}

/*
Physical Domain Profile Variables
*/
variable "profile_physdom" {
	default = {
		"access_phys" = {
			name        = "access_phys"
			vl_pool		= "access"
		},
		"inband_phys" = {
			name        = "inband_phys"
			vl_pool		= "inband"
		},
	}
}

variable "breakouts" {
	default = {
		"2x100g_pg" = {
			description = "400G to 2x100g"
			name        = "2x100g_pg"
			map			= "100g-2x"
		},
		"4x10g_pg" = {
			description = "40G to 4x10g"
			name        = "4x10g_pg"
			map			= "10g-4x"
		},
		"4x25g_pg" = {
			description = "100G to 4x25g"
			name        = "4x25g_pg"
			map			= "25g-4x"
		},
		"4x100g_pg" = {
			description = "400G to 4x100g"
			name        = "4x100g_pg"
			map			= "100g-4x"
		},
		"8x50g_pg" = {
			description = "400G to 8x50g"
			name        = "8x50g_pg"
			map			= "50g-8x"
		},
	}
}