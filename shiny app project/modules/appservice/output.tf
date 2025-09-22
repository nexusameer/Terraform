output "az_app_service_plan_name" {
  value       = azurerm_app_service_plan.sensor_app_service_plan.name
}

output "az_app_service_plan_id" {
  value       = azurerm_app_service_plan.sensor_app_service_plan.id
}

output "acr_pull_role_assignment_id" {
  value       = azurerm_role_assignment.acr_pull_role.id
}

output "acr_pull_role_assignment_name" {
  value       = azurerm_role_assignment.acr_pull_role.role_definition_name
}

output "sensor_app_service_name" {
  value       = azurerm_app_service.sensor_app_service.name
}

output "sensor_app_service_id" {
  value       = azurerm_app_service.sensor_app_service.id
}

output "enable_vnet_image_pull_id" {
  value       = null_resource.enable_vnet_image_pull.id
}

output "app_service_keyvault_role_name" {
  value       = azurerm_role_assignment.app_service_keyvault_role.name
}

output "app_service_keyvault_role_id" {
  value       = azurerm_role_assignment.app_service_keyvault_role.id
}

output "app_service_private_endpoint_name" {
  value       = azurerm_private_endpoint.app_service_private_endpoint.name
}

output "app_service_private_endpoint_id" {
  value       = azurerm_private_endpoint.app_service_private_endpoint.id
}

output "app_service_vnet_integration_id" {
  value       = azurerm_app_service_virtual_network_swift_connection.app_service_vnet_integration.id
}

# output "private_ip_of_app_data_endpoint" {
#   value = data.azurerm_network_interface.apps_private_endpoint_network_interface.ip_configuration[0].private_ip_address
# }

# output "private_ip_of_app_acr_endpoint" {
#   value = data.azurerm_network_interface.apps_private_endpoint_network_interface.ip_configuration[1].private_ip_address
# }

output "app_service_private_dns_a_record_name" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_app_service.name
}

output "app_service_private_dns_a_record_ip" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_app_service.records
}

output "app_service_private_dns_a_record_name_scm" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_app_service_scm.name
}

output "app_service_private_dns_a_record_ip_scm" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_app_service_scm.records
}