variable "tenant" {
  description = "Tenant for the MSO Schema."
  sensitive   = false
  type        = string
}

variable "schema" {
  description = "MSO Schema to configure Attributes in."
  sensitive   = false
  type        = string
}

variable "template" {
  description = "MSO Template assigned to the schema."
  sensitive   = false
  type        = string
}

variable "app_list" {
  description = "Block of Variables to send to MSO."
  sensitive   = false
  type        = list(map(string))
}
