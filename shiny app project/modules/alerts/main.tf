################################################
##                                            ##
##            Alerts For Azure VM             ##
##                                            ##
################################################

resource "azurerm_monitor_metric_alert" "vm_high_usage_alert" {
  name                = "Alert on persistent CPU utilization greater than 90 Shiny VM"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.shiny_vm_id]
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
    action_group_id = var.action_group 
  }
  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "vm_high_network_in_alert" {
  name                = "Virual Machine High Network In"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.shiny_vm_id] 
  description         = "Monitor Network In total greater than 1GB"
  severity            = 2       
  window_size         = "PT1H"  
  frequency           = "PT15M"  

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Network In Total"
    aggregation      = "Total"  
    operator         = "GreaterThan"
    threshold        = 5368709120  # 1GB in bytes (1GB = 1073741824 bytes)
  }

  action {
    action_group_id = var.action_group 
  }

  provider = azurerm.kcri  
}

resource "azurerm_monitor_metric_alert" "vm_high_network_out_alert" {
  name                = "Virual Machine High Network Out"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.shiny_vm_id] 
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
    action_group_id = var.action_group 
  }

  provider = azurerm.kcri  
}

resource "azurerm_monitor_metric_alert" "vm_low_available_memory_alert" {
  name                = "Virtual Machine Low Available Memory"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.shiny_vm_id]
  description         = "Monitor Available Memory less than 500MB"
  severity            = 2       
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Available Memory Bytes"
    aggregation      = "Average"  
    operator         = "LessThan"
    threshold        = 524288000  # 500MB in bytes (500MB = 524288000 bytes)
  }

  action {
    action_group_id = var.action_group 
  }

  provider = azurerm.kcri  
}

################################################
##                                            ##
##               Alerts For Webapp            ##
##                                            ##
################################################

resource "azurerm_monitor_metric_alert" "Webapp_high_memory_alert" {
  name                = "Web App High Memory Usage"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor Web App Memory Working Set usage"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"  
    metric_name      = "MemoryWorkingSet"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 1073741824  
  }

  action {
    action_group_id = var.action_group 
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "Webapp_high_requests_alert" {
  name                = "Web App High Request Count"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high request count in Web App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Requests"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1000  # 1000 requests
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "Webapp_high_response_time_alert" {
  name                = "Web App High Response Time"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high response time in Web App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HttpResponseTime"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 2000  # 2000ms response time
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "Webapp_high_http_4xx_alert" {
  name                = "Web App High Http 4xx Errors"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high HTTP 4xx errors in Web App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http4xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50  # 50 HTTP 4xx errors
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "Webapp_high_http_5xx_alert" {
  name                = "Web App High Http 5xx Error"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high HTTP 5xx errors in Web App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10  # 10 HTTP 5xx errors
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "web_app_high_file_system_usage_alert" {
  name                = "Web App High File System Usage"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high file system usage in Web App"
  severity            = 0  
  window_size         = "PT6H"   #Evaluation window size must be one of [PT6H, PT12H, P1D] for the metric FileSystemUsage
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "FileSystemUsage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90  # 90% usage
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "web_app_health_check_failure_alert" {
  name                = "Web App Health Check Failure"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor Web App Health Check status failure"
  severity            = 0  
  window_size         = "PT5M" 
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HealthCheckStatus"
    aggregation      = "Average"
    operator         = "Equals"
    threshold        = 0  # 0 = Failure, 1 = Success
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "web_app_high_network_in_alert_webapp" {
  name                = "Web App High Network In"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high incoming network traffic in Web App"
  severity            = 0  
  window_size         = "PT5M" 
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "BytesReceived"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1073741824  # 1GB 
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "web_app_network_out_alert_webapp" {
  name                = "Web App High Network Out"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Monitor high outgoing network traffic in Web App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "BytesSent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1073741824  # 1GB 
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

################################################
##                                            ##
##     Alerts For Control Panel app           ##
##                                            ##
################################################

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_memory_alert" {
  name                = "Control Panel App High Memory Usage"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor Control Panel App Memory Working Set usage"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"  
    metric_name      = "MemoryWorkingSet"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 1073741824  
  }

  action {
    action_group_id = var.action_group 
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_requests_alert" {
  name                = "Control Panel App High Request Count"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high request count in Control Panel App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Requests"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1000  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_response_time_alert" {
  name                = "Control Panel App High Response Time"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high response time in Control Panel App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HttpResponseTime"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 2000  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_http_4xx_alert" {
  name                = "Control Panel App High Http 4xx Errors"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high HTTP 4xx errors in Control Panel App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http4xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 50  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_http_5xx_alert" {
  name                = "Control Panel App High Http 5xx Error"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high HTTP 5xx errors in Control Panel App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "Http5xx"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_file_system_usage_alert" {
  name                = "Control Panel App High File System Usage"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high file system usage in Control Panel App"
  severity            = 0  
  window_size         = "PT6H"   #Evaluation window size must be one of [PT6H, PT12H, P1D] for the metric FileSystemUsage
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "FileSystemUsage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = 90  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_health_check_failure_alert" {
  name                = "Control Panel App Health Check Failure"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor Control Panel App Health Check status failure"
  severity            = 0  
  window_size         = "PT5M" 
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "HealthCheckStatus"
    aggregation      = "Average"
    operator         = "Equals"
    threshold        = 0  # 0 = Failure, 1 = Success
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_high_network_in_alert_webapp" {
  name                = "Control Panel App High Network In"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high incoming network traffic in Control Panel App"
  severity            = 0  
  window_size         = "PT5M" 
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "BytesReceived"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1073741824  # 1GB 
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "contol_panel_app_network_out_alert_webapp" {
  name                = "Control Panel App High Network Out"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Monitor high outgoing network traffic in Control Panel App"
  severity            = 0  
  window_size         = "PT5M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "BytesSent"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 1073741824  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "app_service_response_time_sensor_app" {
  name                = "Alert when average response time exceeds user tolerance Sensor App"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.web_app]
  description         = "Alert when average response time exceeds user tolerance"
  severity            = 1  
  window_size         = "PT15M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "AverageResponseTime"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10000  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_metric_alert" "app_service_response_time_cp_app" {
  name                = "Alert when average response time exceeds user tolerance CP App"
  resource_group_name = var.kcri_rg_name
  scopes              = [var.contol_panel_app]
  description         = "Alert when average response time exceeds user tolerance"
  severity            = 1  
  window_size         = "PT15M"  
  frequency           = "PT5M"  

  criteria {
    metric_namespace = "Microsoft.Web/sites"
    metric_name      = "AverageResponseTime"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 10000  
  }

  action {
    action_group_id = var.action_group
  }

  provider = azurerm.kcri
}

resource "azurerm_monitor_scheduled_query_rules_alert" "unavailable_vm" {
  provider            = azurerm.kcri
  name                = "Alert when VM is unavailable heartbeat lost"
  resource_group_name = var.kcri_rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.shiny_vm_id

  # Alert configuration
  description              = "Alert when VM is unavailable heartbeat lost"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    Heartbeat
    | summarize arg_max(TimeGenerated, *) by Computer

  QUERY

  # Alert criteria
  trigger {
    operator  = "Equal"
    threshold = 0
    metric_trigger {
      operator            = "Equal"
      threshold           = 0
      metric_trigger_type = "Total"
      metric_column       = "ErrorCount"
    }
  }
  action {
    action_group = [var.action_group]
  }
}

resource "azurerm_monitor_scheduled_query_rules_alert" "error_rate_change" {
  provider            = azurerm.kcri
  name                = "Alert on high app error rate percentage"
  resource_group_name = var.kcri_rg_name
  location            = var.rg_location

  # Required data source reference
  data_source_id = var.web_app

  # Alert configuration
  description              = "Alert on high app error rate percentage"
  enabled                  = true
  severity                 = 1
  auto_mitigation_enabled  = false

  # Query and evaluation settings
  frequency         = 5    # PT5M - evaluation every 5 minutes
  time_window       = 1440    # PT15M - look back 15 minutes
  query             = <<-QUERY
    FunctionAppLogs 
    | where TimeGenerated > ago(1h)
    | where Level == "Warning" or Level == "Error"
    | summarize count_per_app = count() by _ResourceId
    | sort by count_per_app desc 
    | render columnchart

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