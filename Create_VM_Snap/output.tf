output "managed_disk_id" {
  value = azurerm_managed_disk.copy.id
}

output "public_ip_id" {
  value = azurerm_public_ip.vm_public_ip.id
}

output "network_interface_id" {
  value = azurerm_network_interface.vm_nic.id
}

output "virtual_machine_id" {
  value = azurerm_virtual_machine.myterraformvm.id
}

output "public_ip_address" {
  value = azurerm_public_ip.vm_public_ip.ip_address
}

output "managed_disk_name" {
  value = azurerm_managed_disk.copy.name
}

output "virtual_machine_name" {
  value = azurerm_virtual_machine.myterraformvm.name
}

output "boot_diagnostics_storage_uri" {
  value = azurerm_virtual_machine.myterraformvm.boot_diagnostics.0.storage_uri
}
output "disk_id" {
  value = azurerm_managed_disk.example.id
}
output "disk_name" {
  value = azurerm_managed_disk.example.name
}
output "disk_location" {
  value = azurerm_managed_disk.example.location
}
output "disk_resource_group" {
  value = azurerm_managed_disk.example.resource_group_name
}
output "disk_storage_account_type" {
  value = azurerm_managed_disk.example.storage_account_type
}
output "disk_create_option" {
  value = azurerm_managed_disk.example.create_option
}
output "disk_size_gb" {
  value = azurerm_managed_disk.example.disk_size_gb
}
output "disk_tags" {
  value = azurerm_managed_disk.example.tags
}
