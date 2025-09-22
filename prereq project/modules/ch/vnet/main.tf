resource "azurerm_virtual_network" "ch_vnet" {
  name                = "${var.vnet_ch_name}_${var.environment}"
  address_space       = var.vnet_ch_address_space
  location            = var.location
  resource_group_name = var.resource_group_ch_name
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}


