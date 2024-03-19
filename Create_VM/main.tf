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

# Define the existing virtual network and subnet
data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnetname     #each.value.subnet_name
  virtual_network_name = var.vnetname      #azurerm_virtual_network.myvnet[each.key].name
  resource_group_name  = var.RG    #data.azurerm_resource_group.existing_rg.name
}

# Create a public IP address
resource "azurerm_public_ip" "vm_public_ip" {
  name                = var.publicip_name
  location            = var.location
  resource_group_name = var.RG
  allocation_method   = "Dynamic"
  sku                 = "Standard" 
   tags = {
    "Owner" = var.owner
    "Project" = var.project 
    "Duration" = var.duration
  }
}

# Define the network interface for the VM and attach the public IP
resource "azurerm_network_interface" "vm_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.RG

  ip_configuration {
    name                          = var.privateip_name
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.privateip
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
   tags = {
    "Owner" = var.owner
    "Project" = var.project 
    "Duration" = var.duration
  }
}

# Create virtual machine
resource "azurerm_linux_virtual_machine" "main" {
    name                  = var.vm_name
    location              = var.location #azurerm_resource_group.myrg[each.key].location
    resource_group_name   = var.RG   #data.azurerm_resource_group.existing_rg.name
    network_interface_ids = [azurerm_network_interface.vm_nic.id]
    size                  =  var.vm_size

 admin_username = var.username
 admin_password = var.password
 disable_password_authentication = false

 os_disk {
 name = "OS-disk"
 caching = "ReadWrite"
 storage_account_type = var.disktype
}
source_image_id = var.sourceimageid

 boot_diagnostics {
    storage_account_uri = var.bootdiagnostic
  }

  tags = {
    "Owner" = var.owner
    "Project" = var.project 
    "Duration" = var.duration
  }
}
