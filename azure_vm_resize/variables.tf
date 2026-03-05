variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
}

variable "vm_size" {
  description = "Target VM Size (Scaling)"
  type        = string
}

variable "nic_name" {
  description = "Network Interface Name"
  type        = string
}

variable "os_disk_id" {
  description = "OS Disk ID"
  type        = string
}

variable "os_disk_name" {
  description = "OS Disk Name"
  type        = string
}
