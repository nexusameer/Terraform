resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}_${var.environment}"
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}
