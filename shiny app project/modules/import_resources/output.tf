
output "sensor_rg_name" {
  description = "The name of the sensor resource group"
  value       = data.azurerm_resource_group.az_rg_we_sensor.name
}

output "sensor_rg_location" {
  description = "The ID of the sensor resource group"
  value       = data.azurerm_resource_group.az_rg_we_sensor.location
}

output "sensor_rg_id" {
  description = "The ID of the sensor resource group"
  value       = data.azurerm_resource_group.az_rg_we_sensor.id
}

output "az_snet_we_pe_sensor_id" {
  description = "The ID of the subnet az_snet_we_pe_sensor"
  value       = data.azurerm_subnet.az_snet_we_pe_sensor.id
}

output "az_snet_we_webapp_sensor_id" {
  value = data.azurerm_subnet.az_snet_we_webapp_sensor.id
}

output "az_snet_we_vm_sensor_id" {
  value = data.azurerm_subnet.az_snet_we_vm_sensor.id
}

output "keyvault_core_id" {
  description = "The ID of the key vault"
  value       = data.azurerm_key_vault.az-kv-we-core.id
}

output "key_vault_name" {
  description = "The name of the key vault"
  value       = data.azurerm_key_vault.az-kv-we-core.name
}

output "core_rg_name" {
  description = "The name of the core resource group"
  value       = data.azurerm_resource_group.core_rg.name
}

output "core_rg_id" {
  description = "The ID of the core resource group"
  value       = data.azurerm_resource_group.core_rg.id
}

output "key_vault_url" {
  description = "The URL of the shiny key vault"
  value       = data.azurerm_key_vault.az-kv-we-core.vault_uri
}

output "subnet_address_prefix" {
  value = data.azurerm_subnet.az_snet_we_webapp_sensor.address_prefix
}


# output "acr_private_dns_name" {
#   value = data.azurerm_private_dns_zone.app_acr_private_dns.name
# }

# output "acr_private_dns_id" {
#   value = data.azurerm_private_dns_zone.app_acr_private_dns.id
# }

# output "appservice_private_dns_name" {
#   value = data.azurerm_private_dns_zone.sensor_appservice_private_dns.name
# }

# output "appservice_private_dns_id" {
#   value = data.azurerm_private_dns_zone.sensor_appservice_private_dns.id
# }

output "action_group_id" {
  value = data.azurerm_monitor_action_group.action_group.id
}

output "kcri_rg_name" {
  value = data.azurerm_resource_group.kcri_rg.name
}

output "kcri_rg_location" {
  value = data.azurerm_resource_group.kcri_rg.location
}

output "gitlab_rg_name" {
  value = data.azurerm_resource_group.gitlab_rg.name
}

output "gitlab_rg_id" {
  value = data.azurerm_resource_group.gitlab_rg.id
}

output "soc_security_rg_name" {
  value = data.azurerm_resource_group.soc_security_rg.name
}

output "soc_security_rg_location" {
  value = data.azurerm_resource_group.soc_security_rg.location
}

output "acr_private_dns_name" {
  value = data.azurerm_private_dns_zone.acr_private_dns.name
}

output "acr_private_dns_id" {
  value = data.azurerm_private_dns_zone.acr_private_dns.id
}

output "appservice_private_dns_name" {
  value = data.azurerm_private_dns_zone.appservice_private_dns.name
}

output "appservice_private_dns_id" {
  value = data.azurerm_private_dns_zone.appservice_private_dns.id
}

output "backup_vault_id" {
  value = data.azurerm_data_protection_backup_vault.backup_vault.id
}

output "backup_vault_principal_id" {
  value = data.azurerm_data_protection_backup_vault.backup_vault.identity[0].principal_id 
}

output "backup_vault_name" {
  value = data.azurerm_data_protection_backup_vault.backup_vault.name
}

output "soc_security_rg_id" {
  value = data.azurerm_resource_group.soc_security_rg.id
}

output "loganalytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.loganalytics_workspace.id
}
