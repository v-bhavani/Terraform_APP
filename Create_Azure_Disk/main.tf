provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm"{
    resource_group_name = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name = "terraform"
    key = "terraformtest.tfstate"
 }
}
resource "azurerm_managed_disk" "example" {
  name                 = var.diskname
  location             = var.location  # Replace with your desired location
  resource_group_name  = var.resourcegroup  # Replace with your existing resource group name
  storage_account_type = var.st_acc_type
  create_option        = "Empty"
  disk_size_gb         = var.disksize  # Replace with the desired disk size in GB

  tags = {
    "Owner" : var.Owner
    "Project" : var.Project
    "Duration" : var.Duration
  }
}

# Attach the disk to the existing virtual machine
resource "azurerm_virtual_machine_data_disk_attachment" "source2" {
  managed_disk_id    = azurerm_managed_disk.example.id
  virtual_machine_id = "/subscriptions/bf18f464-1469-4216-834f-9c6694dbfe26/resourceGroups/tfrg/providers/Microsoft.Compute/virtualMachines/tfvm1"
  lun                = var.lun
  caching            = "ReadWrite"
}
