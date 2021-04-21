/*
 - Setting up the Mgmt EPG Distinguished Names
*/
variable "var_inb" {
  description   = "In-Band EPG Distinguished Name"
  type          = string
  default       = "uni/tn-mgmt/mgmtp-default/inb-{{EPG}}"
}

