output "storage_account_key" {
  value     = module.storageaccount.storage_account_key
  sensitive = true
}

output "acr_name" {
  value = module.container_registry.core_acr_name
}

output "acr_private_endpoint_name" {
  value = module.container_registry.acr_private_endpoint_name
}

output "adf_name" {
  value = module.adf.adf_name
}

output "bastion_pip_name" {
  value = module.bastion.bastion_pip_name
}

output "bastion_name" {
  value = module.bastion.bastion_name
}

output "bastion_pip_address" {
  value = module.bastion.bastion_pip_address
}

output "batch_account_name" {
  value = module.batch.batch_account_name
}

output "batch_private_endpoint_name" {
  value = module.batch.batch_private_endpoint_name
}

output "node_private_endpoint_name" {
  value = module.batch.node_private_endpoint_name
}

output "batch_pool_name" {
  value = module.batch.batch_pool_name
}

output "app_service_plan_name" {
  value = module.azure_function_app.app_service_plan_name
}

output "fapp_storage_account_name" {
  value = module.azure_function_app.fapp_storage_account_name
}

output "function_app_id" {
  value = module.azure_function_app.function_app_name
}

output "fapp_pe_name" {
  value = module.azure_function_app.fapp_pe_name
}

output "fapp_blob_pe_name" {
  value = module.azure_function_app.fapp_blob_pe_name
}

output "fapp_file_pe_name" {
  value = module.azure_function_app.fapp_file_pe_name
}

output "fapp_table_pe_name" {
  value = module.azure_function_app.fapp_table_pe_name
}

output "fapp_queue_pe_name" {
  value = module.azure_function_app.fapp_queue_pe_name
}

output "batch_identity_name" {
  value = module.identity.batch_identity_name
}

output "keyvault_name" {
  value = module.key_vault.keyvault_name
}

output "kv_pe_name" {
  value = module.key_vault.kv_pe_name
}

# output "log_security_analytics_name" {
#   value = module.loganalytics.log_security_analytics_name
# }

# output "log_activity_analytics_name" {
#   value = module.loganalytics.log_activity_analytics_name
# }

output "postgres_name" {
  value = module.postgresql.postgres_name
}

output "datalake_account_name" {
  value = module.storageaccount.datalake_account_name
}

output "storage_account_name" {
  value = module.storageaccount.storage_account_name
}

output "key_vault_url" {
  value = module.key_vault.key_vault_url
}
output "acr_private_endpoint_ips" {
  value = module.container_registry.acr_private_endpoint_ips
}

output "acr_private_endpoint_fqdn" {
  value = module.container_registry.acr_private_endpoint_fqdn
}


output "acr_login_server" {
  value = module.container_registry.acr_login_server_name
}

