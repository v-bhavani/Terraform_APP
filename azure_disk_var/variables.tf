variable "resource_group" {
  type        = string
  description = "Resource group name"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "disk_name" {
  type        = string
  description = "Managed Disk name"
}

variable "disk_size" {
  type        = number
  description = "Size of disk in GB"
}

variable "sku" {
  type        = string
  default     = "standars_LRS"
  description = "Storage Account Type"
}
