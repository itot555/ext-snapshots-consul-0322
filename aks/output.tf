output "client_key" {
  description = "Base64 encoded private key used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
  sensitive   = true
}

output "client_certificate" {
  description = "Base64 encoded public certificate used by clients to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
  sensitive   = true
}

output "cluster_ca_certificate" {
  description = "Base64 encoded public CA certificate used as the root of trust for the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
  sensitive   = true
}

output "cluster_username" {
  description = "A username used to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.username
  sensitive   = true
}

output "cluster_password" {
  description = "A password or token used to authenticate to the Kubernetes cluster."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.password
  sensitive   = true
}

output "kube_config" {
  description = "Raw Kubernetes config to be used by kubectl and other compatible tools."
  value       = azurerm_kubernetes_cluster.k8s.kube_config_raw
  sensitive   = true
}

output "host" {
  description = "The Kubernetes cluster server host."
  value       = azurerm_kubernetes_cluster.k8s.kube_config.0.host
}

output "resource_group_name" {
  description = "Azure resource group name"
  value       = azurerm_resource_group.my_rg.name
}

output "kubernetes_cluster_name" {
  description = "AKS cluster name"
  value       = azurerm_kubernetes_cluster.k8s.name
}
