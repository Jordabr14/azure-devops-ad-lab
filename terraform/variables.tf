variable "location" {
  type    = string
  default = "northcentralus"
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

variable "admin_username" {
  type    = string
  default = "azureuser"
}

variable "windows_admin_username" {
  type    = string
  default = "labadmin"
}

variable "windows_admin_password" {
  description = "Password del administrador de Windows (min. 12 caracteres, con mayuscula, minuscula, numero y simbolo)"
  type        = string
  sensitive   = true
}

variable "ssh_public_key_path" {
  type    = string
  default = "~/.ssh/azure_lab.pub"
}

variable "vm_size_linux" {
  type    = string
  default = "Standard_B1s"
}

variable "vm_size_windows" {
  type    = string
  default = "Standard_B2s"
}
