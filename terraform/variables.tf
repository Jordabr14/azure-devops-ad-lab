variable "location" {
  type    = string
  default = "eastus2"
}

variable "prefix" {
  type    = string
  default = "lab"
}

variable "admin_source_ip" {
  description = "Tu IP publica en formato CIDR (x.x.x.x/32) para SSH y RDP"
  type        = string

  validation {
    condition     = can(cidrhost(var.admin_source_ip, 0))
    error_message = "Debe ser un CIDR valido, por ejemplo 203.0.113.5/32"
  }
}
