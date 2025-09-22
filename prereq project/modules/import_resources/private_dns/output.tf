output "acr_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.acr_private_dns_zone.id
}

output "acr_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.acr_private_dns_zone.name
}

output "key_vault_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.key_vault_private_dns_zone.name
}

output "key_vault_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.key_vault_private_dns_zone.id
}

output "function_app_table_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.function_app_table_private_dns_zone.id
}

output "function_app_table_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_table_private_dns_zone.name
}


output "function_app_queue_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.function_app_queue_private_dns_zone.id
}

output "function_app_queue_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_queue_private_dns_zone.name
}

output "function_app_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.function_app_private_dns_zone.id
}

output "function_app_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_private_dns_zone.name
}

output "function_app_file_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_file_private_dns_zone.name
}

output "function_app_file_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.function_app_file_private_dns_zone.id
}

output "function_app_blob_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_blob_private_dns_zone.name
}

output "function_app_blob_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.function_app_blob_private_dns_zone.id
}

output "batch_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.batch_private_dns_zone.id
}

output "batch_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.batch_private_dns_zone.name
}

output "psql_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.psql_private_dns_zone.id
}


output "psql_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.psql_private_dns_zone.name
}

output "gitlab_resource_group_name" {
  value = data.azurerm_resource_group.gitlab_rg.name
}

output "gitlab_vnet_id" {
  value = data.azurerm_virtual_network.gitlab_vnet.id
}

output "gitlab_vnet_name" {
  value = data.azurerm_virtual_network.gitlab_vnet.name
}

output "gitlab_vnet_address_space" {
  value = data.azurerm_virtual_network.gitlab_vnet.address_space
}

output "dns_rg_name" {
  value = data.azurerm_resource_group.dns_rg.name
}


output "eventhub_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.eventhub_private_dns_zone.name
}

output "soc_security_resource_group_name" {
  value = data.azurerm_resource_group.soc_rg.name
}

output "soc_security_resource_group_location" {
  value = data.azurerm_resource_group.soc_rg.location
}

output "aks_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.aks_private_dns_zone.name
}


output "connectivity_vnet_id" {
  value = data.azurerm_virtual_network.connectivity_vnet.id
}


output "connectivity_rg_name" {
  value = data.azurerm_resource_group.connectivity_rg.name
}


output "connectivity_vnet_name" {
  value = data.azurerm_virtual_network.connectivity_vnet.name
}

output "azure_firewall_id" {
  value = data.azurerm_firewall.azure_firewall.id
}

output "azure_firewall_policy_id" {
  value = data.azurerm_firewall_policy.firewall_policy.id
}

output "firewall_private_ip" {
  value = data.azurerm_firewall.azure_firewall.ip_configuration[0].private_ip_address
}
