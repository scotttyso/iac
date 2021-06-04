variable "api_key" {
  description = "API Key"
  type        = string
}

variable "secret_key" {
  description = "Secret Key or file location"
  sensitive   = true
  type        = string
}

variable "endpoint" {
  description = "API Endpoint URL"
  type        = string
  default     = "https://www.intersight.com"
}

variable "organization" {
  description = "Organization Name"
  type        = string
  default     = "default"
}

variable "ssh_user" {
  type        = string
  description = "SSH Username for node login."
}

variable "ssh_key" {
  description = "SSH Public Key to be used to node login."
  sensitive   = true
  type        = string
}

variable "vc_target_name" {
  description = "Virtual Center Host Name."
  sensitive   = false
  type        = string
}

variable "vc_password" {
  description = "Password of the account to be used with vCenter.  This should be the password for the account used to register vCenter with Intersight."
  sensitive   = true
  type        = string
}

variable "tags" {
  type    = list(map(string))
  default = []
}
