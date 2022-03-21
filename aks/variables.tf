variable "client_id" {}
variable "client_secret" {}
variable "resource_group_name" {
  default = "itochu-rg-aks"
}

variable "location" {
  default = "japaneast"
}

variable "tag" {
  default = "demo"
}

variable "virtual_network_name" {
  default = "itochu-aks-vnet"
}

variable "virtual_network_address_prefix" {
  default = "10.10.0.0/16"
}

variable "k8s_subnet_name" {
  default = "itochu-aks-subnet"
}

variable "k8s_subnet_address_prefix" {
  default = "10.10.1.0/24"
}

variable "cluster_name" {
  default = "itochu-aks-consul"
}

variable "dns_prefix" {
  default = "itochu-aks-consul"
}

variable "k8s_version" {
  default = "1.22.6"
}

variable "node_pool_name" {
  default = "consul"
}

variable "aks_agent_count" {
  default = 3
}

variable "aks_agent_vm_size" {
  default = "Standard_D2_v2"
}

variable "aks_agent_os_disk_size" {
  default = 32
}

variable "orchestrator_version" {
  default = "1.22.6"
}
