output "container_registry_id" {
  value       = azurerm_container_registry.sensor_container_registry.id
}

output "container_registry_name" {
  value       = azurerm_container_registry.sensor_container_registry.name
}

output "apps_acr_private_endpoint_name" {
  value       = azurerm_private_endpoint.apps_acr_private_endpoint.name
}

output "apps_acr_private_endpoint_id" {
  value       = azurerm_private_endpoint.apps_acr_private_endpoint.id
}

# output "app_private_dns_a_record_in_core_acr_name" {
#   value       = azurerm_private_dns_a_record.app_private_dns_a_record_in_core_acr.name
# }

# output "app_private_dns_a_record_in_core_acr_id" {
#   value       = azurerm_private_dns_a_record.app_private_dns_a_record_in_core_acr.id
# }



# output "app_private_dns_data_a_record_in_core_acr_name" {
#   value       = azurerm_private_dns_a_record.app_private_dns_data_a_record_in_core_acr.name
# }

# output "app_private_dns_data_a_record_in_core_acr_id" {
#   value       = azurerm_private_dns_a_record.app_private_dns_data_a_record_in_core_acr.id
# }

# output "private_ip_of_acr_data_endpoint" {
#   value = data.azurerm_network_interface.apps_acr_private_endpoint_network_interface.ip_configuration[0].private_ip_address
# }

# output "private_ip_of_acr_endpoint" {
#   value = data.azurerm_network_interface.apps_acr_private_endpoint_network_interface.ip_configuration[1].private_ip_address
# }

output "private_dns_a_record_name" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_acr.name
}

output "private_dns_a_record_ip" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_acr.records
}


output "private_dns_a_record_name_data" {
  value = azurerm_private_dns_a_record.private_dns_data_a_record_in_acr.name
}

output "private_dns_a_record_ip_data" {
  value = azurerm_private_dns_a_record.private_dns_data_a_record_in_acr.records
}
