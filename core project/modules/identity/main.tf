resource "azurerm_user_assigned_identity" "batch_identity" {
  provider            = azurerm.core
  name                = var.identity_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}
