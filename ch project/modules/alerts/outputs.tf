# output "alert_names" {
#   description = "Names of all created metric alerts"
#   value       = [for alert in azurerm_monitor_metric_alert.aks_metric_alerts : alert.name]
# }