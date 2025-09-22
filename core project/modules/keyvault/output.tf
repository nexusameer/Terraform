output "private_service_connection_name" {
  value = azurerm_private_endpoint.kv_private_endpoint.private_service_connection[0].private_ip_address
}

output "private_service_connection_resource_id" {
  value = azurerm_private_endpoint.kv_private_endpoint.private_service_connection[0].private_connection_resource_id
}

output "private_service_connection_subresource_names" {
  value = azurerm_private_endpoint.kv_private_endpoint.private_service_connection[0].subresource_names
}

output "private_service_connection_is_manual_connection" {
  value = azurerm_private_endpoint.kv_private_endpoint.private_service_connection[0].is_manual_connection
}

output "key_vault_id" {
  value = azurerm_key_vault.az-kv.id
}

output "key_vault_private_endpoint_id" {
  value = azurerm_private_endpoint.kv_private_endpoint.id
}

output "keyvault_name" {
  value = azurerm_key_vault.az-kv.name
}

output "kv_pe_name" {
  value = azurerm_private_endpoint.kv_private_endpoint.name
}

output "key_vault_url" {
  value = azurerm_key_vault.az-kv.vault_uri
}
