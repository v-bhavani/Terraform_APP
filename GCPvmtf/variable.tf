variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "region" {
  description = "The region to deploy resources"
  type        = string
}

variable "network_name" {
  description = "The name of the network to use"
  type        = string
}

variable "subnet_name" {
  description = "The name of the subnetwork to use"
  type        = string
}

variable "service_account_email" {
  description = "The email of the service account to use for VMs"
  type        = string
}

variable "snapshot_name" {
  description = "The name of the snapshot to use for VM images"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VMs"
  type        = list(string)
}

variable "vms" {
  description = "List of VMs to create with their associated disks"
  type = list(object({
    name         = string
    machine_type = string
    zone         = string
    private_ip   = string
    disks = list(object({
      name    = string
      size_gb = number
      type    = string
    }))
  }))
}