resource "azurerm_resource_group" "kcri" {
  name     = var.kcri_rg_name
  location = var.location
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.kcri
}
