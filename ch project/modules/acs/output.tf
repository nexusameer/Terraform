output "id" {
  description = "The ID of the Communication Service."
  value       = azurerm_communication_service.acs.id
}

output "primary_connection_string" {
  description = "The primary connection string of the Communication Service."
  value       = azurerm_communication_service.acs.primary_connection_string
}

output "secondary_connection_string" {
  description = "The secondary connection string of the Communication Service."
  value       = azurerm_communication_service.acs.secondary_connection_string
}

output "primary_key" {
  description = "The primary key of the Communication Service."
  value       = azurerm_communication_service.acs.primary_key
}

output "secondary_key" {
  description = "The secondary key of the Communication Service."
  value       = azurerm_communication_service.acs.secondary_key
}

# Only included in azurerm starting from 4.17.0
# output "hostname" {
#     description = "The hostname of the Communication Service"
#     value       = azurerm_communication_service.acs.hostname
# }