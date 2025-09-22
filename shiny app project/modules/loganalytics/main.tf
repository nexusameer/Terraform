resource "azurerm_monitor_diagnostic_setting" "apps_acr_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.apps_container_registry_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
  category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }



resource "azurerm_monitor_diagnostic_setting" "appservice_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.app_service_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }

resource "azurerm_monitor_diagnostic_setting" "appservice_cp_diagnostic_logs" {
  name               = "send_logs_to_log_analytics"
  target_resource_id = var.control_panel_app_service_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider            = azurerm.management
 }




