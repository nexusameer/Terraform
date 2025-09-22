output "data_factory_principal_id" {
  value = azurerm_data_factory.az-adf-we-core.identity[0].principal_id
}


output "adf_name" {
  value = azurerm_data_factory.az-adf-we-core.name
}

output "data_factory_id" {
  value = azurerm_data_factory.az-adf-we-core.id
}
