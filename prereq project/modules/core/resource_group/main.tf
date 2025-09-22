resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}_${var.environment}"
  location = var.location
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}
