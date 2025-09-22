output "batch_account_id" {
  value = azurerm_batch_account.az-ba-we-lss-core.id
}

output "batch_pool_id" {
  value = azurerm_batch_pool.batch_pool.id
}

output "batch_account_name" {
  value = azurerm_batch_account.az-ba-we-lss-core.name
}

output "batch_private_endpoint_name" {
  value = azurerm_private_endpoint.batch_private_endpoint.name
}

output "node_private_endpoint_name" {
  value = azurerm_private_endpoint.nodemanagement_private_endpoint.name
}

output "batch_pool_name" {
  value = azurerm_batch_pool.batch_pool.name
}

output "batch_primary_access_key" {
  value = azurerm_batch_account.az-ba-we-lss-core.primary_access_key
}

output "batch_job_name" {
  value = azurerm_batch_job.batch_job.name
}