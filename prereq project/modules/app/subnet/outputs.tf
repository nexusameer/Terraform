output "webapp_sensor_subnet_name" {
  value = azurerm_subnet.webapp_sensor_subnet.name
}
output "webapp_sensor_address_prefix" {
  value = azurerm_subnet.webapp_sensor_subnet.address_prefixes
}
output "private_endpoint_sensor_subnet_name" {
  value = azurerm_subnet.private_endpoint_sensor_subnet.name
}
output "private_endpoint_sensor_address_prefix" {
  value = azurerm_subnet.private_endpoint_sensor_subnet.address_prefixes
}
output "virtual_machine_sensor_name" {
  value = azurerm_subnet.virtual_machine_sensor_subnet.name
}
output "virtual_machine_sensor_address_prefix" {
  value = azurerm_subnet.virtual_machine_sensor_subnet.address_prefixes
}
output "private_endpoint_sensor_subnet_id" {
  value = azurerm_subnet.private_endpoint_sensor_subnet.id
}

output "webapp_sensor_subnet_id" {
  value = azurerm_subnet.webapp_sensor_subnet.id
}

output "virtual_machine_sensor_subnet_id" {
  value = azurerm_subnet.virtual_machine_sensor_subnet.id
}