output "function_app_master_key" {
  value     = data.azurerm_function_app_host_keys.function_app_keys.primary_key
  sensitive = true
}