################################Commented BY FAHAD######################

# output "core_db_subnet_id" {
#   value = data.azurerm_subnet.core_db_subnet.id
# }
################################Commented BY FAHAD######################

output "resource_group_name" {
  value = data.azurerm_resource_group.core_rg.name
}

output "core_vnet_name" {
  value = data.azurerm_virtual_network.core_vnet.name
}

output "core_vnet_id" {
  value = data.azurerm_virtual_network.core_vnet.id
}

output "connectivity_vnet_id" {
  value = data.azurerm_virtual_network.connectivity_vnet.id
}

output "ch_vnet_id" {
  value = data.azurerm_virtual_network.ch_vnet.id
}

output "gitlab_vnet_id" {
  value = data.azurerm_virtual_network.gitlab_vnet.id
}



output "ch_db_subnet_id" {
  value = data.azurerm_subnet.ch_db_subnet.id
}

output "core_lss_batch_subnet_id" {
  value = data.azurerm_subnet.core_lss_batch_subnet.id
}

output "core_ml_batch_subnet_id" {
  value = data.azurerm_subnet.core_ml_batch_subnet.id
}

output "core_lss_pe_subnet_id" {
  value = data.azurerm_subnet.core_lss_pe_subnet.id
}

output "tenant_id" {
  value = data.azurerm_client_config.root.tenant_id
}

output "psql_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.psql_private_dns_zone.id
}

output "psql_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.psql_private_dns_zone.name
}

output "batch_private_dns_zone_id" {
  value = data.azurerm_private_dns_zone.batch_private_dns_zone.id
}

output "batch_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.batch_private_dns_zone.name
}


output "core_rg_location" {
  value = data.azurerm_resource_group.core_rg.location
}
# output "postgres_admin_object_id" {
#   value = data.azuread_service_principal.postgres_admin.object_id
# }

# output "admin_principal_name" {
#   value = data.azuread_service_principal.postgres_admin.display_name
# }

output "sensor_rg_name" {
  description = "The name of the sensor resource group"
  value       = data.azurerm_resource_group.az_rg_we_sensor.name
}

output "sensor_rg_location" {
  description = "The ID of the sensor resource group"
  value       = data.azurerm_resource_group.az_rg_we_sensor.location
}


# output "az_snet_we_pe_sensor_id" {
#   description = "The ID of the subnet az_snet_we_pe_sensor"
#   value       = data.azurerm_subnet.az_snet_we_pe_sensor.id
# }

# output "az_snet_we_webapp_sensor_id" {
#   value = data.azurerm_subnet.az_snet_we_webapp_sensor.id
# }

# output "az_snet_we_vm_sensor_id" {
#   value = data.azurerm_subnet.az_snet_we_vm_sensor.id
# }

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

output "dns_rg_name" {
  value = data.azurerm_resource_group.dns_rg.name
}

output "core_rg_id" {
  description = "The ID of the core resource group"
  value       = data.azurerm_resource_group.core_rg.id
}

output "connectivity_rg_id" {
  description = "The ID of the core resourcee group"
  value       = data.azurerm_resource_group.connectivity_rg.id
}

output "key_vault_url" {
  description = "The URL of the shiny key vault"
  value       = data.azurerm_key_vault.az-kv-we-core.vault_uri
}

# output "subnet_address_prefix" {
#   value = data.azurerm_subnet.az_snet_we_webapp_sensor.address_prefix
# }


# output "acr_private_dns_name" {
#   value = data.azurerm_private_dns_zone.app_acr_private_dns.name
# }

output "acr_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.acr_private_dns.name
}


output "acrdpcore_name" {
  value = data.azurerm_container_registry.acrdpcore.id
}

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

output "gitlab_rg_name" {
  value = data.azurerm_resource_group.gitlab_rg.name
}

output "gitlab_rg_id" {
  value = data.azurerm_resource_group.gitlab_rg.id
}

# output "acr_id" {
#   value = data.azurerm_container_registry.container_registry_id.id
# }

output "acr_login_server_name" {
  value = data.azurerm_container_registry.container_registry_id.login_server
}

output "acr_private_dns_name" {
  value = data.azurerm_private_dns_zone.acr_private_dns.name
}

output "blob_private_dns_name" {
  value = data.azurerm_private_dns_zone.blob_private_dns.name
}

output "file_private_dns_name" {
  value = data.azurerm_private_dns_zone.file_private_dns.name
}

output "table_private_dns_name" {
  value = data.azurerm_private_dns_zone.table_private_dns.name
}

output "queue_private_dns_name" {
  value = data.azurerm_private_dns_zone.queue_private_dns.name
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

output "ch_aks_subnet_id" {
  value = data.azurerm_subnet.az_snet_we_aks_ch.id
}

output "pe_subnet_ch_id" {
  value = data.azurerm_subnet.pe_subnet_ch.id
}

output "core_inv_vm_subnet_id" {
  value = data.azurerm_subnet.az_snet_we_vm_inv.id
}

output "ch_agic_subnet_id" {
  value = data.azurerm_subnet.az_snet_we_agic_ch.id
}

output "ch_rg_name" {
  value = data.azurerm_resource_group.az_rg_we_ch.name
}

output "connectivity_rg_name" {
  value = data.azurerm_resource_group.connectivity_rg.name
}

output "tre_ch_rg_name" {
  value = data.azurerm_resource_group.tre_ch.name
}

output "ch_rg_id" {
  description = "The ID of the ch resource group"
  value       = data.azurerm_resource_group.ch_rg.id
}

output "ch_rg_location" {
  description = "The ID of the CH resource group"
  value       = data.azurerm_resource_group.az_rg_we_ch.location
}

output "aks_dns_zone_id" {
  value = data.azurerm_private_dns_zone.aks_private_dns_zone.id
}

output "core_pe_subnet_id" {
  value = data.azurerm_subnet.core_pe_subnet.id
}

output "ch_pe_subnet_id" {
  value = data.azurerm_subnet.pe_subnet_ch.id
}


# output "storage_account_name" {
#   value = data.azurerm_storage_account.azsawefappcore.name
# }

# output "storage_account_key" {
#   value = data.azurerm_storage_account.azsawefappcore.primary_access_key
# }

output "identity_id" {
  value = data.azurerm_user_assigned_identity.identity.id
}

output "batch_identity_principal_id" {
  value = data.azurerm_user_assigned_identity.identity.principal_id
}

output "gitlab_resource_group_name" {
  value = data.azurerm_resource_group.gitlab_resource_group.name
}

output "core_eh_subnet_id" {
  value = data.azurerm_subnet.core_eh_subnet.id
}

output "eh_private_dns_zone_name" {
  value = data.azurerm_private_dns_zone.eh_private_dns_zone.name
}

output "core_lss_fap_subnet_id" {
  value = data.azurerm_subnet.core_lss_fap_subnet.id
}

output "core_inv_fap_subnet_id" {
  value = data.azurerm_subnet.core_inv_fap_subnet.id
}

output "core_inv_pe_subnet_id" {
  value = data.azurerm_subnet.core_inv_pe_subnet.id
}

output "core_inv_db_subnet_id" {
  value = data.azurerm_subnet.core_inv_db_subnet.id
}

output "core_ml_pe_subnet_id" {
  value = data.azurerm_subnet.core_ml_pe_subnet.id
}

output "core_ml_fap_subnet_id" {
  value = data.azurerm_subnet.core_ml_fap_subnet.id
}

output "log_analytics_workspace_id" {
  value = data.azurerm_log_analytics_workspace.az-law-we-security-logs.id
}

output "core_adf_id" {
  value = data.azurerm_data_factory.core_adf.id
}
# output "agic_id" {
#   value = data.azurerm_application_gateway.agic_id.id
# }