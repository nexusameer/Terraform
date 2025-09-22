output "function_app_id" {
  value = azurerm_linux_function_app.az_fap_we_dp_core.id
}

output "function_app_name" {
  value = azurerm_linux_function_app.az_fap_we_dp_core.name
}

output "function_app_default_hostname" {
  value = azurerm_linux_function_app.az_fap_we_dp_core.default_hostname
}

output "function_app_principal_id" {
  value = azurerm_linux_function_app.az_fap_we_dp_core.identity[0].principal_id
}


output "app_service_plan_name" {
  value = azurerm_service_plan.az-asp-prem-we-core.name
}


output "fapp_storage_account_name" {
  value = azurerm_storage_account.azsawefapcore.name
}

output "fapp_storage_account_id" {
  value = azurerm_storage_account.azsawefapcore.id
}

output "fapp_pe_name" {
  value = azurerm_private_endpoint.function_app_private_endpoint.name
}

output "fapp_blob_pe_name" {
  value = azurerm_private_endpoint.blob_private_endpoint.name
}

output "fapp_file_pe_name" {
  value = azurerm_private_endpoint.file_private_endpoint.name
}

output "fapp_table_pe_name" {
  value = azurerm_private_endpoint.table_private_endpoint.name
}

output "fapp_queue_pe_name" {
  value = azurerm_private_endpoint.queue_private_endpoint.name
}