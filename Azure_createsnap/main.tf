provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm"{
    resource_group_name = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name = "terraform"
    key = "terraformtest1.tfstate"
 }
}
# Data source to get details of the existing disk
data "azurerm_managed_disk" "disk" {
  name                = var.diskname
  resource_group_name = var.rg
}

# Resource to create a snapshot from the existing disk
resource "azurerm_snapshot" "snapshot" {
  name                = var.snapname
  resource_group_name = data.azurerm_managed_disk.disk.resource_group_name
  location            = var.region

  create_option       = "Copy"
  source_uri          = data.azurerm_managed_disk.disk.id

  tags = {
    "Owner" = var.owner
    "Project" = var.project
  }
}
