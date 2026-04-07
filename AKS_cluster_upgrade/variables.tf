variable "resource_group_name" {
  description = "Azure Resource Group Name"
  type        = string
}
variable "cluster_name" {
  description = "AKS Cluster Name"
  type        = string
}
variable "dns_prefix" {
  description = "AKS Cluster DNS Prefix"
  type        = string
}
variable "appId" {
  description = "Service Principal App ID"
  type        = string
}
variable "password" {
  description = "Service Principal Password"
  type        = string
}
variable "location" {
  description = "AKS Cluster Location"
  type        = string
}
variable "oidc_issuer_enabled" {
  description = "Enable OIDC Issuer for AKS Cluster"
  type        = bool
}
variable "cluster_version" {
  description = "AKS Cluster Kubernetes Version"
  type        = string
}
variable "node_pool_name" {
  description = "AKS Cluster Node Pool Name"
  type        = string
}
variable "node_count" {
  description = "Number of nodes in the default node pool"
  type        = number
}
variable "vm_size" {
  description = "VM size for the default node pool"
  type        = string
}
variable "os_disk_size_gb" {
  description = "OS disk size in GB for the default node pool"
  type        = number
}
