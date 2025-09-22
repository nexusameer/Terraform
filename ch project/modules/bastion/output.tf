# output "diagnostics_container_name" {
#   value       = azurerm_storage_container.diagnostics_container.name
#   description = "The name of the diagnostics storage container"
# }

# output "diagnostics_container_id" {
#   value       = azurerm_storage_container.diagnostics_container.id
#   description = "The ID of the diagnostics storage container"
# }

# output "bastion_nic_name" {
#   value       = azurerm_network_interface.bastion_nic.name
#   description = "The name of the Bastion network interface"
# }

# output "bastion_nic_id" {
#   value       = azurerm_network_interface.bastion_nic.id
#   description = "The ID of the Bastion network interface"
# }

# output "bastion_name" {
#   value       = azurerm_windows_virtual_machine.az-bastion-we-ch.name
#   description = "The name of the bastion virtual machine"
# }

# output "bastion_id" {
#   value       = azurerm_windows_virtual_machine.az-bastion-we-ch.id
#   description = "The ID of the bastion virtual machine"
# }

output "log_analytics_workspace_name" {
  value       = azurerm_log_analytics_workspace.workspace.name
  description = "The name of the log analytics workspace"
}

output "log_analytics_workspace_id" {
  value       = azurerm_log_analytics_workspace.workspace.id
  description = "The ID of the log analytics workspace"
}

# output "bastion_diag_name" {
#   value       = azurerm_monitor_diagnostic_setting.bastion_diag.name
#   description = "The name of the bastion diagnostic setting"
# }

# output "bastion_diag_id" {
#   value       = azurerm_monitor_diagnostic_setting.bastion_diag.id
#   description = "The ID of the bastion diagnostic setting"
# }

# output "diag_container_name" {
#   value       = azurerm_storage_container.diag_container.name
#   description = "The name of the diagnostics container"
# }

# output "diag_container_id" {
#   value       = azurerm_storage_container.diag_container.id
#   description = "The ID of the diagnostics container"
# }

# output "diagnostics_extension_name" {
#   value       = azurerm_virtual_machine_extension.diagnostics_extension.name
#   description = "The name of the diagnostics extension"
# }

# output "diagnostics_extension_id" {
#   value       = azurerm_virtual_machine_extension.diagnostics_extension.id
#   description = "The ID of the diagnostics extension"
# }

# output "storage_account_name" {
#   value       = azurerm_storage_account.azsawebootdiagapps.name
#   description = "The name of the storage account"
# }

# output "storage_account_id" {
#   value       = azurerm_storage_account.azsawebootdiagapps.id
#   description = "The ID of the storage account"
# }
