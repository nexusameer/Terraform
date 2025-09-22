output "gitlab_acr_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_acr_link.name
}

output "gitlab_acr_link_virtual_network_id" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_acr_link.virtual_network_id
}

output "gitlab_psql_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_postgres_link.name
}

output "gitlab_psql_link_virtual_network_id" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_postgres_link.virtual_network_id
}

output "gitlab_batch_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_batch_link.name
}

output "gitlab_batch_link_virtual_network_id" {
  value = azurerm_private_dns_zone_virtual_network_link.gitlab_batch_link.virtual_network_id
}
