provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name       = "terraform"
    key                  = "terraformstop.tfstate"
  }
}

# Fetch the existing VM details
data "azurerm_virtual_machine" "existing_vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
}

# Resource to stop and deallocate the VM using a local-exec provisioner
resource "null_resource" "stop_vm" {
    settings = <<SETTINGS
    {
      "commandToExecute": "az vm deallocate --resource-group ${var.vm_name} --name ${var.resource_group_name}"
    }
  SETTINGS

  triggers = {
    vm_id = data.azurerm_virtual_machine.existing_vm.id
  }
}
