output "core_vault_name" {
  value = azurerm_private_dns_zone.core_vault.name
}
output "core_batch_account_name" {
  value = azurerm_private_dns_zone.core_batch_account.name
}

output "core_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_link.name
}

output "core_psql_dns_name" {
  value = azurerm_private_dns_zone.core_psql_dns.name
}

output "core_psql_dns_vnet_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_psql_dns_vnet.name
}

output "core_batch_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_batch_link.name
}

output "core_acr_private_dns_name" {
  value = azurerm_private_dns_zone.core_acr_private_dns.name
}

output "core_acr_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_acr_link.name
}

output "core_fap_private_dns_name" {
  value = azurerm_private_dns_zone.core_fap_private_dns.name
}

output "core_network_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_network.name
}

output "core_file_dns_name" {
  value = azurerm_private_dns_zone.core_file_dns.name
}

output "core_file_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_file_link.name
}

output "core_table_fap_dns_name" {
  value = azurerm_private_dns_zone.core_table_fap_dns.name
}

output "core_queue_fap_dns_name" {
  value = azurerm_private_dns_zone.core_queue_fap_dns.name
}

output "core_fap_dns_name" {
  value = azurerm_private_dns_zone.core_fap_dns.name
}

output "core_table_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_table_link.name
}

output "core_queue_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_queue_link.name
}

output "core_blob_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.core_blob_link.name
}
