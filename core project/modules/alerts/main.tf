resource "azurerm_monitor_metric_alert" "datalake_success_e2e_latency" {
  name                = "High SuccessE2ELatency"
  resource_group_name = var.rg_name
  scopes              = [var.datalake]
  description         = "Datalake Account Latency"
  severity            = 2       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "SuccessE2ELatency"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 800
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "datalake_success_server_latency" {
  name                = "High SuccessServerLatency"
  resource_group_name = var.rg_name
  scopes              = [var.datalake]
  description         = "Datalake Success Server Latency"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "SuccessServerLatency"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 150
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "datalake_low_availability" {
  name                = "Low Availability"
  resource_group_name = var.rg_name
  scopes              = [var.datalake]
  description         = "Datalake Low Availability"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Availability"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 99.9
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "datalake_high_used_capacity" {
  name                = "Alert when capacity utilization exceeds threshold"
  resource_group_name = var.rg_name
  scopes              = [var.datalake]
  description         = "Datalake High Used Capacity"
  severity            = 1      # Critical
  window_size         = "P1D" # Lookback period
  frequency           = "PT1H" # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90000000000
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}



resource "azurerm_monitor_metric_alert" "storage_account_success_e2e_latency" {
  name                = "Alert on low success request rate"
  resource_group_name = var.rg_name
  scopes              = [var.storage_account]
  description         = "Storage Account Latency"
  severity            = 2       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "SuccessE2ELatency"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 800
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_ingress" {
  name                = "Alert on total ingress exceeding expected volume"
  resource_group_name = var.rg_name
  scopes              = [var.storage_account]
  description         = "Storage Account Ingress"
  severity            = 2       # Critical
  window_size         = "PT1H" # Lookback period  
  frequency           = "PT1H"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Ingress"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 10737418240
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_success_server_latency" {
  name                = "Storage Account High SuccessServerLatency"
  resource_group_name = var.rg_name
  scopes              = [var.storage_account]
  description         = "Storage Account Success Server Latency"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "SuccessServerLatency"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 150
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_low_availability" {
  name                = "Storage Account Low Availability"
  resource_group_name = var.rg_name
  scopes              = [var.storage_account]
  description         = "Storage Account Low Availability"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Availability"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 99.9
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_high_used_capacity" {
  name                = "Storage Account High Used Capacity"
  resource_group_name = var.rg_name
  scopes              = [var.storage_account]
  description         = "Storage Account High Used Capacity"
  severity            = 0      # Critical
  window_size         = "PT1H" # Lookback period
  frequency           = "PT5M" # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90000000000
  }

  action {
    action_group_id = var.action_group #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_low_dedicated_core_count" {
  name                = "Batch Low Dedicated Core Count"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Dedicated Core Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "CoreCount"
    aggregation      = "Total"
    operator         = "LessThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_low_priority_core_count" {
  name                = "Batch Low-Priority Core Count"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Low Priority Core Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "LowPriorityCoreCount"
    aggregation      = "Total"
    operator         = "LessThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_start_task_failed_node_count" {
  name                = "Batch Failed Start Tasks"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Start Task Failed Node Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "StartTaskFailedNodeCount"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_task_fail_events" {
  name                = "Batch High Task Failures"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Task Fail Events"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "TaskFailEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}


resource "azurerm_monitor_metric_alert" "batch_preempted_node_count" {
  name                = "Batch High Preempted Nodes"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Preempted Node Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "PreemptedNodeCount"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 3
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_unusable_node_count" {
  name                = "Alert if nodes enter unusable state preempted or disk failure"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Preempted Node Count"
  severity            = 1       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "UnusableNodeCount"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "terminate_complete_event" {
  name                = "Alert on job termination with completion or output"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Job Terminate Complete Events"
  severity            = 2       # Critical
  window_size         = "PT1H" # Lookback period
  frequency           = "PT1H"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "JobTerminateCompleteEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_dedicated_node_count" {
  name                = "Batch Low Dedicated Node Count"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Dedicated Node Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "TotalNodeCount"
    aggregation      = "Total"
    operator         = "LessThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_task_start_events" {
  name                = "Batch High Task Start Events"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Dedicated Node Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "TaskStartEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 100
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}


resource "azurerm_monitor_metric_alert" "batch_job_terminate_start_events" {
  name                = "Alert on job termination start completion or output"
  resource_group_name = var.rg_name
  scopes              = [var.batch_account]
  description         = "Batch Dedicated Node Count"
  severity            = 0       # Critical
  window_size         = "PT15M" # Lookback period
  frequency           = "PT5M"  # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "JobTerminateStartEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }
  provider = azurerm.tre
}

################################################
##                                            ##
##               Alerts For KeyVault          ##
##                                            ##
################################################

resource "azurerm_monitor_metric_alert" "key_vault_low_availability_alert" {
  name                = "Key Vault Low Vault Availability"
  resource_group_name = var.rg_name
  scopes              = [var.keyvault_id]
  description         = "Monitor Key Vault overall availability"
  severity            = 0
  window_size         = "PT5M"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.KeyVault/vaults"
    metric_name      = "Availability"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 99.9 # 99.9% availability
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "key_vault_high_service_api_latency_alert" {
  name                = "Key Vault High Service API Latency"
  resource_group_name = var.rg_name
  scopes              = [var.keyvault_id]
  description         = "Monitor Key Vault service API latency"
  severity            = 0
  window_size         = "PT5M"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.KeyVault/vaults"
    metric_name      = "ServiceApiLatency"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 200 # 200ms latency
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "key_vault_no_api_results_alert" {
  name                = "Key Vault No API Results"
  resource_group_name = var.rg_name
  scopes              = [var.keyvault_id]
  description         = "Monitor Key Vault service API results"
  severity            = 0
  window_size         = "PT5M"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.KeyVault/vaults"
    metric_name      = "ServiceApiResult"
    aggregation      = "Total"
    operator         = "LessThan"
    threshold        = 1 # Less than 1 API result
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "key_vault_high_saturation_alert" {
  name                = "Key Vault High Vault Saturation"
  resource_group_name = var.rg_name
  scopes              = [var.keyvault_id]
  description         = "Monitor Key Vault overall saturation"
  severity            = 0
  window_size         = "PT5M"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.KeyVault/vaults"
    metric_name      = "SaturationShoebox"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90 # 90% vault saturation
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

################################################
##                                            ##
##            Alerts For Datafactory          ##
##                                            ##
################################################

resource "azurerm_monitor_metric_alert" "data_factory_failed_activity_runs_alert" {
  name                = "FailedActivityRunsAlert"
  resource_group_name = var.rg_name
  scopes              = [var.data_factory_id]
  description         = "Monitor failed activity runs in Data Factory"
  severity            = 0
  window_size         = "PT5M"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "ActivityFailedRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "data_factory_failed_pipeline_runs_alert" {
  name                = "Alert on high volume of failed pipeline runs"
  resource_group_name = var.rg_name
  scopes              = [var.data_factory_id]
  description         = "Monitor failed pipeline runs in Data Factory"
  severity            = 1
  window_size         = "PT1H"
  frequency           = "PT15M"

  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "PipelineFailedRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "data_factory_failed_trigger_runs_alert" {
  name                = "Alert if trigger fails to start pipelines due to config errors"
  resource_group_name = var.rg_name
  scopes              = [var.data_factory_id]
  description         = "Monitor failed trigger runs in Data Factory"
  severity            = 2
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "TriggerFailedRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "data_factory_elapsed_time_pipeline_runs_metrics" {
  name                = "Alert on long pipeline execution time indicating job slowness"
  resource_group_name = var.rg_name
  scopes              = [var.data_factory_id]
  description         = "Monitor failed trigger runs in Data Factory"
  severity            = 2
  window_size         = "PT1H"
  frequency           = "PT15M"
  criteria {
    metric_namespace = "Microsoft.DataFactory/factories"
    metric_name      = "PipelineElapsedTimeRuns"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 60000
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "db_read_iops" {
  name                = "Alert on read IOPS"
  resource_group_name = var.rg_name
  scopes              = [var.database_id]
  description         = "Alert on read IOPS"
  severity            = 2
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "read_iops"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 100
  }

  action {
    action_group_id = var.action_group
  }
 provider            = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "db_write_iops" {
  name                = "Alert on write IOPS"
  resource_group_name = var.rg_name
  scopes              = [var.database_id]
  description         = "Alert on read IOPS"
  severity            = 2
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.DBforPostgreSQL/flexibleServers"
    metric_name      = "write_iops"
    aggregation      = "Average"
    operator         = "LessThan"
    threshold        = 100
  }

  action {
    action_group_id = var.action_group
  }
  provider            = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "function_app_execution" {
  name                = "Alert on long execution time exceeding SLA"
  resource_group_name = var.rg_name
  scopes              = [var.functionapp_id]
  description         = "Alert on long execution time exceeding SLA"
  severity            = 1
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "FunctionExecutionUnits"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1800
  }

  action {
    action_group_id = var.action_group
  }
  provider            = azurerm.tre
}


resource "azurerm_monitor_scheduled_query_rules_alert" "datalake_high_write_latency" {
  provider            = azurerm.tre
  name                = "Alert on sustained high latency in write operations"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.datalake_account_id

  # Alert configuration
  description              = "Alert on sustained high latency in write operations"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    StorageBlobLogs
| where TimeGenerated > ago(30m)
| where OperationName in ("PutBlock", "PutBlockList")
| where isnotempty(ServerLatencyMs)
| where ServerLatencyMs > 1
| summarize CountAbove1Ms = count() by bin(TimeGenerated, 1m), AccountName
| where CountAbove1Ms > 0


  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 400
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 400
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "datalake_high_read_latency" {
  provider            = azurerm.tre
  name                = "Alert on sustained high latency in read operations"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.datalake_account_id

  # Alert configuration
  description              = "Alert on sustained high latency in read operations"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
StorageBlobLogs
| where TimeGenerated > ago(10m)
| where OperationName in ("GetBlob", "GetBlobProperties", "GetBlockList")
| where isnotempty(ServerLatencyMs)
| where ServerLatencyMs > 1
| summarize CountAbove1Ms = count() by bin(TimeGenerated, 1m), AccountName
| where CountAbove1Ms > 0



  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 300
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 300
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}




resource "azurerm_monitor_scheduled_query_rules_alert" "storage_server_busy_alert" {
  provider            = azurerm.tre
  name                = "Alert on high number of throttling errors"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.storage_account_id

  # Alert configuration
  description              = "Alert when Storage ServerBusy errors exceed threshold"
  enabled                  = true
  severity                 = 2
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    StorageBlobLogs
    | where TimeGenerated > ago(3d) and StatusText contains "ServerBusy"
    | project TimeGenerated, OperationName, StatusCode, StatusText, _ResourceId
  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 20
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 20
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}



resource "azurerm_monitor_scheduled_query_rules_alert" "storage_high_latency_alert" {
  provider            = azurerm.tre
  name                = "Alert on sustained write latency above threshold"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.storage_account_id

  # Alert configuration
  description              = "Alert on sustained write latency above threshold"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    StorageBlobLogs
    | where TimeGenerated > ago(3d)
    | summarize 
        AggregatedValue = max(DurationMs),
        OperationName = arg_max(DurationMs, OperationName),
        ServerLatencyMs = arg_max(DurationMs, ServerLatencyMs),
        ClientLatencyMs = arg_max(DurationMs, DurationMs - ServerLatencyMs),
        SampleTime = arg_max(DurationMs, TimeGenerated)
      by bin(TimeGenerated, 15m)
    | top 10 by AggregatedValue desc
    | project 
        TimeGenerated = SampleTime,
        OperationName,
        DurationMs = AggregatedValue,
        ServerLatencyMs,
        ClientLatencyMs
  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 400
    # metric_trigger {
    #   operator            = "GreaterThan"
    #   threshold           = 400
    #   metric_trigger_type = "Total"
    #   metric_column       = "ErrorCount"
    # }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "abnormal_drop_keyvault" {
  provider            = azurerm.tre
  name                = "Alert on abnormal drop in success rate"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.keyvault_id

  # Alert configuration
  description              = "Alert on abnormal drop in success rate"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AzureDiagnostics
    | where TimeGenerated > ago(5m)
    | where ResourceType == "VAULTS"
    | where OperationName == "SecretGet"
    | summarize
      total_requests = count(),
        successful_requests = countif(httpStatusCode_d == 200),
        failed_requests = countif(httpStatusCode_d != 200)
        by Resource
    | extend 
        success_rate = todouble(successful_requests) / total_requests * 100,
        failure_rate = todouble(failed_requests) / total_requests * 100
    | where successful_requests > 0 and success_rate < 90
  QUERY

  # Alert criteria
  trigger {
    operator  = "LessThan"
    threshold = 90
    metric_trigger {
      operator            = "LessThan"
      threshold           = 90
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "expired_secrets_keyvault" {
  provider            = azurerm.tre
  name                = "Alert on expired secret access attempts"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.keyvault_id

  # Alert configuration
  description              = "Alert on abnormal drop in success rate"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AzureDiagnostics
    | where OperationName == "SecretExpiredEventGridNotification"
    | extend SecretName = extract(@"secrets/([^/]+)", 1, eventGridEventProperties_subject_s)
    | project TimeGenerated, Resource, SecretName, eventGridEventProperties_subject_s
    | order by TimeGenerated desc

  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 0
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 0
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "pool_resize_fail" {
  provider            = azurerm.tre
  name                = "Alert if compute pool doesn't scale out when expected"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.batch_account

  # Alert configuration
  description              = "Alert if compute pool doesn't scale out when expected"
  enabled                  = true
  severity                 = 2
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency          = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AzureDiagnostics
    | where ResourceProvider == "MICROSOFT.BATCH"
    | where OperationName == "PoolResizeCompleteEvent"
    | where TimeGenerated > ago(1d)
    | where ResultType != "Success" or ResultType == "Failure"
    | project TimeGenerated, PoolId = id_s, ResultType, ResultDescription, ResourceId

  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 10
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 10
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "backup_restore_fail" {
  provider            = azurerm.tre
  name                = "Alert when restore operation fails"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.backup_vault_id

  # Alert configuration
  description              = "Alert when restore operation fails"
  enabled                  = true
  severity                 = 2
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AddonAzureBackupJobs
    | where TimeGenerated > ago(1d)
    | where JobOperation == "Restore"
    | where isnotempty(JobFailureCode)
    | summarize FailedRestoreCount = count() by bin(TimeGenerated, 1d), ResourceId
    | where FailedRestoreCount > 0
  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 0
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 0
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "failed_backup_jobs" {
  provider            = azurerm.tre
  name                = "Alert when backup job fails repeatedly"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.backup_vault_id

  # Alert configuration
  description              = "Alert when backup job fails repeatedly"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AddonAzureBackupJobs
    | where TimeGenerated > ago(7d)
    | where isnotempty(JobFailureCode)
    | project TimeGenerated, JobOperation, JobFailureCode, BackupManagementType, JobStartDateTime
    | sort by TimeGenerated desc

  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 3
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 3
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "function_error_rate" {
  provider            = azurerm.tre
  name                = "Alert on continuous function failures"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.functionapp_id

  # Alert configuration
  description              = "Alert on continuous function failures"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    FunctionAppLogs
    | where Category startswith "Function." and Message startswith "Executed "
    | parse Message with "Executed '" Name "' ("  Result ", Id=" Id ", Duration=" Duration:long "ms)"
    | summarize count() by bin(TimeGenerated, 1h), Name, Result, _ResourceId
    | order by TimeGenerated desc
  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 5
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 5
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "db_slow_job_execution" {
  provider            = azurerm.tre
  name                = "Alert on slow job execution"
  resource_group_name = var.rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.database_id

  # Alert configuration
  description              = "Alert on slow job execution"
  enabled                  = true
  severity                 = 2
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    AzureDiagnostics
| where ResourceProvider == "MICROSOFT.DBFORMYSQL"
| where resultDescription_Summary_DurationInMinutes_d > 0.3
| where TimeGenerated > ago(5m)
| project TimeGenerated, RunOn_s, resultDescription_Summary_DurationInMinutes_d, resource_actionName_s, ResourceId


  QUERY

  # Alert criteria
  trigger {
    operator  = "GreaterThan"
    threshold = 1
    metric_trigger {
      operator            = "GreaterThan"
      threshold           = 1
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}