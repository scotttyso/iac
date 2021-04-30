/*
*** main.tf Variables **
- To Protect Sensitive Information from a GitHub repository, store these variables in your environment using:
  TF_VAR_<variable>='value' 
  In Example:
  TF_VAR_aciUser='admin'
- If you want to store Sensitive Information in this file, then in the variable attributes add the default value... 
  For Example:
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
  default       = "https://brahma-apic2.rich.ciscolabs.com"
}

