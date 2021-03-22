/*
*** main.tf Variables **
- To not publicly store this information on GitHub store these variables in your environment using
  TF_VAR_<variable>='value' in example:
  TF_VAR_aciUser='admin'
- If you want to store in this file then in the variable attributes add the value... for example:
  variable "aciUser" {
    default   = "admin"
  }
*/
variable "aciUser" {
  description   = "If using a Domain with the User Remember to add apic#[domain]\\<username>"
  type          = string
  sensitive     = true
}

variable "aciPass" {
  type          = string
  sensitive     = true
}

variable "aciUrl" {
  description   = "This can be the IP or Hostname of the ACI Host you will be configuring"
  type          = string
  default       = "{{APIC_URL}}"
}
