output "cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.name
}

output "id" {
  description = "Id of the AKS"
  value       = azurerm_kubernetes_cluster.this.id
}

output "fqdn" {
  description = "The FQDN of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.private_fqdn
}

output "identity" {
  description = "The identity block of the AKS cluster"
  value       = azurerm_kubernetes_cluster.this.identity
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.this.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.this.kube_admin_config
  sensitive = true
}

# output "aks_private_ip" {
#   value = azurerm_private_endpoint.aks_private_endpoint.private_service_connection[0].private_ip_address
# }

# output "aks_dns_name" {
#   value = data.azurerm_private_endpoint_connection.ple_connection.private_service_connection.0.name
# }

output "agic_identity_object_id" {
  value = azurerm_kubernetes_cluster.this.ingress_application_gateway[0].effective_gateway_id
}