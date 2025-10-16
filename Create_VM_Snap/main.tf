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

resource "azurerm_managed_disk" "copy" {
  name = "main-os-disk"
  location = var.location
  resource_group_name = var.RG
  storage_account_type = var.disktype
  create_option = "Copy"
  source_resource_id = var.snapuri
  disk_size_gb = var.osdisksize
}

# Define the existing virtual network and subnet
data "azurerm_subnet" "existing_subnet" {
  name                 = var.subnetname
  virtual_network_name = var.vnetname
  resource_group_name  = var.RG
}

# Create a public IP address
resource "azurerm_public_ip" "vm_public_ip" {
  name                = "public-ip"
  location            = var.location
  resource_group_name = var.RG
  allocation_method   = "Dynamic"
  sku                 = "Basic" 
  tags = {
    "Project" = "${var.project}"
    "Duration" = "${var.duration}"
    "Owner" = "${var.owner}"
  }
}
# Define the network interface for the VM and attach the public IP
resource "azurerm_network_interface" "vm_nic" {
  name                = var.vm_names
  location            = var.location
  resource_group_name = var.RG

  ip_configuration {
    name                          = var.vm_names
    subnet_id                     = data.azurerm_subnet.existing_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.ip
    public_ip_address_id          = azurerm_public_ip.vm_public_ip.id
  }
  tags = {
    "Project" = "${var.project}"
    "Duration" = "${var.duration}"
    "Owner" = "${var.owner}"
  }
}

# Create virtual machine
resource "azurerm_virtual_machine" "myterraformvm" {
    name                  = var.vm_names
    location              = var.location
    resource_group_name   = var.RG
    network_interface_ids = [azurerm_network_interface.vm_nic.id]
    vm_size               = var.vm_size


    storage_os_disk {
    name              = azurerm_managed_disk.copy.name
    os_type           = "Linux"
    managed_disk_id   = azurerm_managed_disk.copy.id
    disk_size_gb      = var.osdisksize
    create_option     = "Attach"
    }

  os_profile_linux_config {
    disable_password_authentication = false
  }

 boot_diagnostics {
    enabled = "true"
    storage_uri = var.bootdiagnostic
  }
}


