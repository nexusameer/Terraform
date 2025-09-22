output "acr_sensor_private_dns_name" {
  value = azurerm_private_dns_zone.acr_sensor_private_dns.name
}

output "acr_sensor_private_dns_id" {
  value = azurerm_private_dns_zone.acr_sensor_private_dns.id
}

output "acr_sensor_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.acr_sensor_link.name
}

output "acr_sensor_link_id" {
  value = azurerm_private_dns_zone_virtual_network_link.acr_sensor_link.id
}

output "sensor_appservice_dns_name" {
  value = azurerm_private_dns_zone.sensor_appservice-dns.name
}

output "sensor_appservice_dns_id" {
  value = azurerm_private_dns_zone.sensor_appservice-dns.id
}

output "sensor_appservice_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_appservice_link.name
}

output "sensor_appservice_link_id" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_appservice_link.id
}

output "sensor_link_name" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_link.name
}

output "sensor_link_id" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_link.id
}

# output "sensor_batch_link_name" {
#   value = azurerm_private_dns_zone_virtual_network_link.sensor_batch_link.name
# }

# output "sensor_batch_link_id" {
#   value = azurerm_private_dns_zone_virtual_network_link.sensor_batch_link.id
# }

output "sensor_psql_dns_vnet_name" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_psql_dns_vnet.name
}

output "sensor_psql_dns_vnet_id" {
  value = azurerm_private_dns_zone_virtual_network_link.sensor_psql_dns_vnet.id
}
