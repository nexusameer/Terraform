# resource "azurerm_log_analytics_workspace" "az-law-we-security-logs" {
#   provider            = azurerm.core
#   name                = "${var.az_law_we_security_logs}-${var.environment}"
#   location            = var.core_rg_location
#   resource_group_name = var.core_rg
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )

# }

# resource "azurerm_log_analytics_workspace" "az-law-we-activity-logs" {
#   provider            = azurerm.core
#   name                = "${var.az_law_we_activity_logs}-${var.environment}"
#   location            = var.core_rg_location
#   resource_group_name = var.core_rg
#   sku                 = "PerGB2018"
#   retention_in_days   = 30
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
# }

resource "azurerm_monitor_diagnostic_setting" "adf_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.data_factory_id
  log_analytics_workspace_id = var.log_analytics_workspace_id
  

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }



resource "azurerm_monitor_diagnostic_setting" "acr_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.container_registry_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

resource "azurerm_monitor_diagnostic_setting" "batch_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.batch_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

resource "azurerm_monitor_diagnostic_setting" "postgres_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.postgres_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

resource "azurerm_monitor_diagnostic_setting" "key_vault_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.key_vault_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

 resource "azurerm_monitor_diagnostic_setting" "storage_account_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = "${var.storage_account_id}/blobServices/default" 
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  provider            = azurerm.management
 }
 resource "azurerm_monitor_diagnostic_setting" "datalake_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = "${var.datalake_account_id}/blobServices/default" 
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  provider            = azurerm.management
 }

resource "azurerm_monitor_diagnostic_setting" "function_app_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.function_app_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

 resource "azurerm_monitor_diagnostic_setting" "backup_vault_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.backup_vault_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "allLogs"
  }
  
  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

