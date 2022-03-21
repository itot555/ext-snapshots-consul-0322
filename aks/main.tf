terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }
  required_version = ">= 0.14.9"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "my_rg" {
  name     = var.resource_group_name
  location = var.location
  tags = {
    Name = var.tag
  }
}

resource "azurerm_virtual_network" "my_vnet" {
  name                = var.virtual_network_name
  resource_group_name = azurerm_resource_group.my_rg.name
  location            = var.location
  address_space       = [var.virtual_network_address_prefix]
}

resource "azurerm_subnet" "k8s_subnet" {
  name                 = var.k8s_subnet_name
  resource_group_name  = azurerm_resource_group.my_rg.name
  virtual_network_name = azurerm_virtual_network.my_vnet.name
  address_prefixes     = [var.k8s_subnet_address_prefix]
}

resource "azurerm_kubernetes_cluster" "k8s" {
  name                = var.cluster_name
  location            = azurerm_resource_group.my_rg.location
  resource_group_name = azurerm_resource_group.my_rg.name
  dns_prefix          = var.dns_prefix

  kubernetes_version = var.k8s_version

  default_node_pool {
    name                 = var.node_pool_name
    node_count           = var.aks_agent_count
    vm_size              = var.aks_agent_vm_size
    os_disk_size_gb      = var.aks_agent_os_disk_size
    availability_zones   = ["1", "2", "3"]
    orchestrator_version = var.orchestrator_version

    vnet_subnet_id = azurerm_subnet.k8s_subnet.id
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }


  network_profile {
    load_balancer_sku = "Standard"
    network_plugin    = "azure"
    network_policy    = "calico"
  }

  depends_on = [azurerm_virtual_network.my_vnet]

  tags = {
    Version = var.tag
  }
}
