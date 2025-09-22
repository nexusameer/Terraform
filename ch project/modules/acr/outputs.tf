output "acr_id" {
  description = "The ID of the Azure Container Registry."
  value       = azurerm_container_registry.azcrwedpch.id
}

output "acr_login_server_name" {
  description = "The login server URL for the container registry."
  value       = azurerm_container_registry.azcrwedpch.login_server
}

output "ch_acr_name" {
  value = azurerm_container_registry.azcrwedpch.name
}

output "acr_private_endpoint_name" {
  value = azurerm_private_endpoint.acr_private_endpoint.name
}

output "acr_private_endpoint_ip" {
  value = azurerm_private_endpoint.acr_private_endpoint.private_service_connection[0].private_ip_address
}

output "acr_private_endpoint_ips" {
  value = flatten(azurerm_private_endpoint.acr_private_endpoint[*].custom_dns_configs[*].ip_addresses)
}

output "acr_private_endpoint_fqdn" {
  value = flatten(azurerm_private_endpoint.acr_private_endpoint[*].custom_dns_configs[*].fqdn)
}

