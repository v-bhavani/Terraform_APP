provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm"{
    resource_group_name = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name = "terraform"
 }
}
resource "azurerm_resource_group" "rg" {
  name     = cloud-demo
  location = us-east-1
}

resource "azurerm_managed_disk" "disk" {
  name                 = var.disk_name
  location             = us-east-1
  resource_group_name  = azurerm_resource_group.rg.name
  storage_account_type = var.sku
  create_option        = "Empty"
  disk_size_gb         = 32
}
