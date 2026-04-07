provider "azurerm" {
  features {}
}

terraform {
  backend "azurerm"{
    resource_group_name = "cloud-demo"
    storage_account_name = "testcloud001423"
    container_name = "terraform"
    key = "terraformaks.tfstate"
  }
}

resource "azurerm_kubernetes_cluster" "aks_cluster" {
  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix
  oidc_issuer_enabled = true
  kubernetes_version  = "1.34"

  default_node_pool {
    name            = "default"
    node_count      = 2
    vm_size         = "Standard_D2s_v4"
    os_disk_size_gb = 30
  }

  service_principal {
    client_id     = var.appId
    client_secret = var.password
  }

  role_based_access_control_enabled = true

  tags = {
    environment = "Demo"
  }
  lifecycle {
    prevent_destroy = true
  }
}
