resource "azurerm_log_analytics_workspace" "az-law-we-security-logs" {
  provider            = azurerm.security
  name                = var.az_law_we_security_logs
  location            = var.security_rg_location
  resource_group_name = var.soc_security_rg_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )

}







