output "storage_account_id" {
  value = azurerm_storage_account.azsawestagingcore.id
}

output "storage_account_name" {
  description = "Name of the storage account"
  value       = azurerm_storage_account.azsawestagingcore.name
}

output "storage_account_key" {
  value = azurerm_storage_account.azsawestagingcore.primary_access_key
}
output "datalake_id" {
  value = azurerm_storage_account.azsawedatalakecore.id
}
output "storage_account_connection_string" {
  value       = azurerm_storage_account.azsawestagingcore.primary_connection_string
  description = "The primary connection string for the Azure Storage Account"
}

output "datalake_url" {
  value = format("https://%s.dfs.core.windows.net/", azurerm_storage_account.azsawedatalakecore.name)
}

output "storage_account_url" {
  value = format("https://%s.dfs.core.windows.net/", azurerm_storage_account.azsawestagingcore.name)
}


output "datalake_account_name" {
  value = azurerm_storage_account.azsawedatalakecore.name
}

output "datalake_account_key" {
  value = azurerm_storage_account.azsawedatalakecore.primary_access_key
}

output "bronze_container_name" {
  value = azurerm_storage_container.datalakebronze.name
}

output "silver_container_name" {
  value = azurerm_storage_container.datalakesilver.name
}