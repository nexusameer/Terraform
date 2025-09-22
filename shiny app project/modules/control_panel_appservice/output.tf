output "control_panel_app_service_name" {
  value       = azurerm_app_service.control_panel_app_service.name
}

output "control_panel_app_service_id" {
  value       = azurerm_app_service.control_panel_app_service.id
}

output "control_app_acr_pull_role_id" {
  value       = azurerm_role_assignment.control_app_acr_pull_role.id
}

output "control_app_acr_pull_role_name" {
  value       = azurerm_role_assignment.control_app_acr_pull_role.role_definition_name
}

output "control_app_service_keyvault_role_name" {
  value       = azurerm_role_assignment.control_app_service_keyvault_role.name
}

output "control_app_service_keyvault_role_id" {
  value       = azurerm_role_assignment.control_app_service_keyvault_role.id
}

output "control_app_service_vnet_integration_id" {
  value       = azurerm_app_service_virtual_network_swift_connection.control_app_service_vnet_integration.id
}

# output "private_ip_of_control_app_data_endpoint" {
#   value = data.azurerm_network_interface.control_app_private_endpoint_network_interface.ip_configuration[0].private_ip_address
# }

# output "private_ip_of_control_app_acr_endpoint" {
#   value = data.azurerm_network_interface.control_app_private_endpoint_network_interface.ip_configuration[1].private_ip_address
# }


output "cp_app_service_private_dns_a_record_name" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_cp_app_service.name
}

output "cp_app_service_private_dns_a_record_ip" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_cp_app_service.records
}

output "cp_app_service_private_dns_a_record_name_scm" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_cp_app_service_scm.name
}

output "cp_app_service_private_dns_a_record_ip_scm" {
  value = azurerm_private_dns_a_record.private_dns_a_record_in_cp_app_service_scm.records
}