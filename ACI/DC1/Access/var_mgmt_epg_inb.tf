/*
 - Setting up the Mgmt EPG Distinguished Names
*/
variable "var_inb" {
  description   = "in_band Distinguished Name"
  type          = string
  default       = "uni/tn-mgmt/mgmtp-default/inb-default"
}

