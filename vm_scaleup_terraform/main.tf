provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm"{
    resource_group_name = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name = "terraform"
    key = "terraformvm.tfstate"
}
}

# Get existing Resource Group
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

# Get existing NIC
data "azurerm_network_interface" "nic" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

resource "azurerm_virtual_machine" "vm" {
  name                  = var.vm_name
  location              = data.azurerm_resource_group.rg.location
  resource_group_name   = data.azurerm_resource_group.rg.name
  network_interface_ids = [data.azurerm_network_interface.nic.id]
  vm_size               = var.vm_size

  storage_os_disk {
    name            = var.os_disk_name
    managed_disk_id = var.os_disk_id
    create_option   = "Attach"
    caching         = "ReadWrite"
  }

  lifecycle {
    prevent_destroy = true
  }
}
 