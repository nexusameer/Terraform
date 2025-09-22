resource "azurerm_monitor_action_group" "action_group" {
  name                = "notification_critical_events"
  resource_group_name = var.resource_group_name
  short_name          = "critical"

  email_receiver {
    name                    = "email"
    email_address           = var.recipient
    use_common_alert_schema = true
  }

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.kcri
}