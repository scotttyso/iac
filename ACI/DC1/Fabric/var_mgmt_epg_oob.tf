/*
 - Setting up the Mgmt EPG Distinguished Names
*/
variable "var_oob" {
  description   = "out_of_band Distinguished Name"
  type          = string
  default       = "uni/tn-mgmt/mgmtp-default/oob-default"
}

