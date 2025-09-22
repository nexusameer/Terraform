resource "azurerm_resource_group" "kvap_rg" {
  name     = "${var.kvap_rg_name}_${var.environment}"
  location = var.location
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}
