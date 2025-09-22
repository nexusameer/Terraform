resource "azurerm_monitor_diagnostic_setting" "lss_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.lss_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "inv_wq_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.inv_wq_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "crs_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.crs_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "inv_lss_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.inv_lss_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "inv_ml_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.inv_ml_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "ml_function_app_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.ml_functionapp_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "ch_eventhub_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.ch_eventhub_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "core_eventhub_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.core_eventhub_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "ch_postgres_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.ch_postgresql_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "inv_postgres_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.inv_postgresql_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "ch_acr_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.ch_container_registry_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "aks_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.aks_id
  log_analytics_workspace_id = var.log_analytics_workspace_id


  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "batch_lss_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.batch_lss_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "batch_ml_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.batch_ml_account_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "AllMetrics"
  }

  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "inv_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.inv_storage_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "blob_inv_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.inv_storage_id}/blobServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "queue_inv_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.inv_storage_id}/queueServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "file_inv_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.inv_storage_id}/fileServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "table_inv_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.inv_storage_id}/tableServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "lss_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.lss_hist_storage_id
  log_analytics_workspace_id = var.log_analytics_workspace_id


  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "blob_lss_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.lss_hist_storage_id}/blobServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "queue_lss_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.lss_hist_storage_id}/queueServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "file_lss_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.lss_hist_storage_id}/fileServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "table_lss_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.lss_hist_storage_id}/tableServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "ml_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.ml_hist_storage_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}


resource "azurerm_monitor_diagnostic_setting" "blob_ml_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.ml_hist_storage_id}/blobServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id
  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "queue_ml_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.ml_hist_storage_id}/queueServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "file_ml_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.ml_hist_storage_id}/fileServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }
  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "table_ml_hist_storage_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.ml_hist_storage_id}/tableServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "sanursery_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = var.sanursery_id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}



resource "azurerm_monitor_diagnostic_setting" "blob_sanursery_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.sanursery_id}/blobServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "queue_sanursery_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.sanursery_id}/queueServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "file_sanursery_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.sanursery_id}/fileServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}

resource "azurerm_monitor_diagnostic_setting" "table_sanursery_account_diagnostic_logs" {
  name                       = "send_logs_to_log_analytics"
  target_resource_id         = "${var.sanursery_id}/tableServices/default"
  log_analytics_workspace_id = var.log_analytics_workspace_id

  enabled_log {
    category_group = "audit"

  }

  metric {
    category = "Transaction"
  }

  lifecycle {
    ignore_changes = [metric]
  }
  provider = azurerm.management
}
# resource "azurerm_monitor_diagnostic_setting" "key_vault_diagnostic_logs" {
#   name               = "send_logs_to_log_analytics"
#   target_resource_id = var.key_vault_id
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   enabled_log {
#   category_group = "audit"

#   }

#   metric {
#     category = "AllMetrics"
#   }
#   provider            = azurerm.management
#  }


#  resource "azurerm_monitor_diagnostic_setting" "datalake_diagnostic_logs" {
#   name               = "send_logs_to_log_analytics"
#   target_resource_id = "${var.datalake_account_id}/blobServices/default" 
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   enabled_log {
#   category_group = "audit"

#   }

#   metric {
#     category = "Transaction"
#   }
#   provider            = azurerm.management
#  }

#  resource "azurerm_monitor_diagnostic_setting" "backup_vault_diagnostic_logs" {
#   name               = "send_logs_to_log_analytics"
#   target_resource_id = var.backup_vault_id
#   log_analytics_workspace_id = var.log_analytics_workspace_id

#   enabled_log {
#     category_group = "allLogs"
#   }

#   metric {
#     category = "AllMetrics"
#   }
#   provider            = azurerm.management
#  }

