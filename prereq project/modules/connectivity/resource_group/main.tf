resource "azurerm_resource_group" "soc_security" {
  name     = var.soc_security_rg_name
  location = var.security_rg_location
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.security
}