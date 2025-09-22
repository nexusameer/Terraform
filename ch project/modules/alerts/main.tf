# resource "azurerm_monitor_metric_alert" "aks_metric_alerts" {
#   for_each = { for metric in var.aks_alert_metrics : metric.name => metric }

#   name                = "${var.prefix}-${each.key}"
#   resource_group_name = var.resource_group_name
#   scopes              = [var.scope_resource_id]
#   severity            = each.value.severity
#   enabled             = true
#   description         = each.value.description != null ? each.value.description : "Auto-alert for ${each.key}"

#   criteria {
#     metric_namespace = each.value.metric_namespace
#     metric_name      = each.value.name
#     aggregation      = each.value.aggregation
#     operator         = each.value.operator
#     threshold        = each.value.threshold
#   }

#   frequency   = var.frequency
#   window_size = var.window_size

#   action {
#     action_group_id = var.action_group_id
#   }
# }


resource "azurerm_monitor_metric_alert" "aks_cluster_node_status" {
  name                = "Alert if node becomes unavailable"
  resource_group_name = var.resource_group_name
  scopes              = [var.scope_resource_id]
  description         = "Alert Node Status Condition"
  severity            = 1
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.ContainerService/managedClusters"
    metric_name      = "kube_node_status_condition"
    aggregation      = "Total"
    operator         = "GreaterThanOrEqual"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "aks_cluster_pod_status" {
  name                = "Alert if pod not in running state"
  resource_group_name = var.resource_group_name
  scopes              = [var.scope_resource_id]
  description         = "Alert Pod Status Condition"
  severity            = 1
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.ContainerService/managedClusters"
    metric_name      = "kube_pod_status_ready"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "ch_event_hub_server_error" {
  name                = "Alert when producer errors spike"
  resource_group_name = var.resource_group_name
  scopes              = [var.ch_event_hub_id]
  description         = "Event Hub Server Error"
  severity            = 1
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.EventHub/namespaces"
    metric_name      = "ServerErrors"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "core_event_hub_server_error" {
  name                = "ServerErrors"
  resource_group_name = var.core_rg_name
  scopes              = [var.core_event_hub_id]
  description         = "Event Hub Server Error"
  severity            = 1
  window_size         = "PT15M"
  frequency           = "PT5M"
  criteria {
    metric_namespace = "Microsoft.EventHub/namespaces"
    metric_name      = "ServerErrors"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "db_read_iops" {
  for_each            = toset(var.database_id)
  name                = "Alert on DBFS read failures"
  resource_group_name = var.resource_group_name
  scopes              = [each.value]
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
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "db_write_iops" {
  for_each            = toset(var.database_id)
  name                = "Alert on DBFS write failures"
  resource_group_name = var.resource_group_name
  scopes              = [each.value]
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
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "batch_unusable_node_count" {
  for_each            = var.batch_account
  name                = "Batch Unusable Node"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
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
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "terminate_start_event" {
  for_each            = var.batch_account
  name                = "Job Terminate Start Events"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
  description         = "Job Terminate Start Events"
  severity            = 2      # Critical
  window_size         = "PT1H" # Lookback period
  frequency           = "PT1H" # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "JobTerminateStartEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "terminate_complete_event" {
  for_each            = var.batch_account
  name                = "Job Terminate Complete Events - ${each.key}"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
  description         = "Job Terminate Complete Events"
  severity            = 2      # Critical
  window_size         = "PT1H" # Lookback period
  frequency           = "PT1H" # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Batch/batchAccounts"
    metric_name      = "JobTerminateCompleteEvent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 0
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "vm_high_network_in_alert" {
  name                = "INV VM High Network In"
  resource_group_name = var.core_rg_name
  scopes              = [var.inv_vm_id]
  description         = "Monitor Network In total greater than 1GB"
  severity            = 2
  window_size         = "PT1H"
  frequency           = "PT15M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Network In Total"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5368709120 # 1GB in bytes (1GB = 1073741824 bytes)
  }

  action {
    action_group_id = var.action_group_id
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "vm_high_network_out_alert" {
  name                = "INV VM High Network Out"
  resource_group_name = var.core_rg_name
  scopes              = [var.inv_vm_id]
  description         = "Monitor Network Out total greater than 1GB"
  severity            = 2
  window_size         = "PT1H"
  frequency           = "PT15M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Network Out Total"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 5368709120
  }

  action {
    action_group_id = var.action_group_id
  }

  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "vm_high_usage_alert" {
  name                = "Alert on persistent CPU utilization greater than 90"
  resource_group_name = var.core_rg_name
  scopes              = [var.inv_vm_id]
  description         = "Monitor VM CPU usage over 80%"
  severity            = 2
  window_size         = "PT1H"
  frequency           = "PT5M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}


resource "azurerm_monitor_metric_alert" "function_app_execution" {
  for_each            = var.functionapp_id
  name                = "Alert on functionapp long execution time exceeding SLA - ${each.key}"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
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
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}


resource "azurerm_monitor_metric_alert" "storage_account_success_e2e_latency" {
  for_each            = var.storage_account
  name                = "Alert on low success request rate - ${each.key}"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
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
    action_group_id = var.action_group_id #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_high_used_capacity" {
  for_each            = var.storage_account
  name                = "Alert when capacity utilization exceeds threshold - ${each.key}"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
  description         = "Inv Storage Account Latency"
  severity            = 1
  window_size         = "P1D"
  frequency           = "PT1H"

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "UsedCapacity"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90000000000
  }

  action {
    action_group_id = var.action_group_id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_metric_alert" "storage_account_ingress" {
  for_each            = var.storage_account
  name                = "Alert on total ingress exceeding expected volume - ${each.key}"
  resource_group_name = var.core_rg_name
  scopes              = [each.value]
  description         = "Storage Account Ingress"
  severity            = 2      # Critical
  window_size         = "PT1H" # Lookback period  
  frequency           = "PT1H" # Check every 5 minutes

  criteria {
    metric_namespace = "Microsoft.Storage/storageAccounts"
    metric_name      = "Ingress"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 10737418240
  }

  action {
    action_group_id = var.action_group_id #azurerm_monitor_action_group.action_group.id
  }
  provider = azurerm.tre
}

resource "azurerm_monitor_scheduled_query_rules_alert" "pod_crash_loop" {
  provider            = azurerm.tre
  name                = "Alert on pod crash loops"
  resource_group_name = var.core_rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.aks_id

  # Alert configuration
  description             = "Alert on pod crash loops"
  enabled                 = true
  severity                = 1
  auto_mitigation_enabled = false

  # Query and evaluation settings
  frequency   = 5    # PT5M - evaluation every 5 minutes
  time_window = 1440 # PT15M - look back 15 minutes
  query       = <<-QUERY
    KubePodInventory
    | where ContainerStatus == 'waiting' 
    | where ContainerStatusReason == 'CrashLoopBackOff' or ContainerStatusReason == 'Error'
    | extend ContainerLastStatus=todynamic(ContainerLastStatus)
    | summarize RestartCount = arg_max(ContainerRestartCount, Computer, Namespace, ContainerLastStatus.reason) by Name
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
    action_group = [var.action_group_id]
  }
}


resource "azurerm_monitor_scheduled_query_rules_alert" "aks_memory_pressusre" {
  provider            = azurerm.tre
  name                = "Alert on memory pressure node condition"
  resource_group_name = var.core_rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.aks_id

  # Alert configuration
  description             = "Alert on memory pressure node condition"
  enabled                 = true
  severity                = 1
  auto_mitigation_enabled = false

  # Query and evaluation settings
  frequency   = 5    # PT5M - evaluation every 5 minutes
  time_window = 1440 # PT15M - look back 15 minutes
  query       = <<-QUERY
    let endDateTime = now();
    let startDateTime = ago(1h);
    let trendBinSize = 1m;
    let capacityCounterName = 'memoryCapacityBytes';
    let usageCounterName = 'memoryRssBytes';
    KubeNodeInventory
    | where TimeGenerated < endDateTime
    | where TimeGenerated >= startDateTime
    | distinct ClusterName, Computer, _ResourceId
    | join hint.strategy=shuffle (
        Perf
        | where TimeGenerated < endDateTime
        | where TimeGenerated >= startDateTime
        | where ObjectName == 'K8SNode'
        | where CounterName == capacityCounterName
        | summarize LimitValue = max(CounterValue) by Computer, CounterName, bin(TimeGenerated, trendBinSize)
        | project
            Computer,
            CapacityStartTime = TimeGenerated,
            CapacityEndTime = TimeGenerated + trendBinSize,
            LimitValue
        )
        on Computer
    | join kind=inner hint.strategy=shuffle (
        Perf
        | where TimeGenerated < endDateTime + trendBinSize
        | where TimeGenerated >= startDateTime - trendBinSize
        | where ObjectName == 'K8SNode'
        | where CounterName == usageCounterName
        | project Computer, UsageValue = CounterValue, TimeGenerated
        )
        on Computer
    | where TimeGenerated >= CapacityStartTime and TimeGenerated < CapacityEndTime
    | project
        ClusterName,
        Computer,
        TimeGenerated,
        UsagePercent = UsageValue * 100.0 / LimitValue,
        _ResourceId
    | summarize AggregatedValue = avg(UsagePercent) by bin(TimeGenerated, trendBinSize), ClusterName, _ResourceId

  QUERY

  # Alert criteria
  trigger {
    operator  = "Equal"
    threshold = 1
    metric_trigger {
      operator            = "Equal"
      threshold           = 1
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group_id]
  }
}


resource "azurerm_monitor_scheduled_query_rules_alert" "aks_cpu_usage" {
  provider            = azurerm.tre
  name                = "Alert when CPU usage is constantly high for a pod"
  resource_group_name = var.core_rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.aks_id

  # Alert configuration
  description             = "Alert when CPU usage is constantly high for a pod"
  enabled                 = true
  severity                = 2
  auto_mitigation_enabled = false

  # Query and evaluation settings
  frequency   = 5    # PT5M - evaluation every 5 minutes
  time_window = 1440 # PT15M - look back 15 minutes
  query       = <<-QUERY
let endDateTime = now();
let startDateTime = ago(1h);
let trendBinSize = 1m;
let capacityCounterName = 'cpuCapacityNanoCores';
let usageCounterName = 'cpuUsageNanoCores';
KubeNodeInventory
| where TimeGenerated < endDateTime
| where TimeGenerated >= startDateTime
| distinct ClusterName, Computer, _ResourceId
| join hint.strategy=shuffle (
    Perf
    | where TimeGenerated < endDateTime
    | where TimeGenerated >= startDateTime
    | where ObjectName == 'K8SNode'
    | where CounterName == capacityCounterName
    | summarize LimitValue = max(CounterValue) by Computer, CounterName, bin(TimeGenerated, trendBinSize)
    | project
        Computer,
        CapacityStartTime = TimeGenerated,
        CapacityEndTime = TimeGenerated + trendBinSize,
        LimitValue
    )
    on Computer
| join kind=inner hint.strategy=shuffle (
    Perf
    | where TimeGenerated < endDateTime + trendBinSize
    | where TimeGenerated >= startDateTime - trendBinSize
    | where ObjectName == 'K8SNode'
    | where CounterName == usageCounterName
    | project Computer, UsageValue = CounterValue, TimeGenerated
    )
    on Computer
| where TimeGenerated >= CapacityStartTime and TimeGenerated < CapacityEndTime
| project
    ClusterName,
    Computer,
    TimeGenerated,
    UsagePercent = UsageValue * 100.0 / LimitValue,
    _ResourceId
| summarize AggregatedValue = avg(UsagePercent) by bin(TimeGenerated, trendBinSize), ClusterName, _ResourceId


  QUERY

  # Alert criteria
  trigger {
    operator  = "Equal"
    threshold = 1000
    metric_trigger {
      operator            = "Equal"
      threshold           = 1000
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group_id]
  }
}


terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}

