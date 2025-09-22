output "app_sensor_vnet_name" {
  value = azurerm_virtual_network.sensor_vnet.name
}

output "app_sensor_vnet_address_space" {
  value = azurerm_virtual_network.sensor_vnet.address_space
}

output "app_sensor_vnet_id" {
  value = azurerm_virtual_network.sensor_vnet.id
}