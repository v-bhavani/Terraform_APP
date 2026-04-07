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
