variable "mso_domain" {
  description = "Domain for MSO Authentication."
  sensitive   = true
  type        = string
}

variable "mso_password" {
  description = "Password for MSO Authentication."
  sensitive   = true
  type        = string
}

variable "mso_hostname" {
  description = "Hostname or IP Address for MSO Connectivity."
  sensitive   = false
  type        = string
}

variable "mso_user" {
  description = "Username for MSO Authentication."
  default     = "admin"
  sensitive   = false
  type        = string
}
