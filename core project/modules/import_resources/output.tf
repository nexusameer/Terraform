output "core_rg" {
  value = data.azurerm_resource_group.core_rg.name
}

output "core_rg_id" {
  value = data.azurerm_resource_group.core_rg.id
}

output "core_rg_location" {
  value = data.azurerm_resource_group.core_rg.location
}

output "core_vnet_id" {
  value = data.azurerm_virtual_network.core_vnet.id
}

output "core_pe_subnet_id" {
  value = data.azurerm_subnet.core_pe_subnet.id
}

output "bastion_subnet_id" {
  value = data.azurerm_subnet.bastion_subnet.id
}


output "core_function_app_subnet_id" {
  value = data.azurerm_subnet.core_function_app_subnet.id
}


output "core_batch_account_subnet_id" {
  value = data.azurerm_subnet.core_batch_account_subnet.id
}

output "core_db_subnet_id" {
  value = data.azurerm_subnet.core_db_subnet.id
}


output "acr_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.acr_private_dns_zone.name
}

output "core_key_vault_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.core_key_vault_private_dns_zone.name
}


output "table_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.table_private_dns_zone.name
}


output "queue_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.queue_private_dns_zone.name
}

output "function_app_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.function_app_private_dns_zone.name
}

output "file_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.file_private_dns_zone.name
}


output "blob_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.blob_private_dns_zone.name
}

output "batch_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.batch_private_dns_zone.name
}

output "action_group_id" {
  value = data.azurerm_monitor_action_group.action_group.id
}

output "gitlab_resource_group_name" {
  value = data.azurerm_resource_group.gitlab_rg.name
}


output "psql_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.psql_private_dns_zone.id
}

output "object_id" {
  value = data.azurerm_client_config.root.object_id
}

output "backup_vault_id" {
  value = data.azurerm_data_protection_backup_vault.backup_vault.id
}

# output "backup_vault_principal_id" {
#   value = data.azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id
# }

output "azurerm_data_protection_backup_vault_principal_id" {
  value = data.azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id #length(data.azurerm_data_protection_backup_vault.backup_vault.identity) > 0 ? data.azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id : "No identity assigned"
}

output "soc_security_rg_id" {
  value = data.azurerm_resource_group.soc_security_rg.id
}

output "soc_security_rg_location" {
  value = data.azurerm_resource_group.soc_security_rg.location
}

output "loganalytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.loganalytics_workspace.id
}