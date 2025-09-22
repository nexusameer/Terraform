resource "azurerm_virtual_network" "vnet" {
  name                = "${var.kvap_vnet_name}_${var.environment}"
  location            = var.location
  resource_group_name = var.kvap_rg_name
  address_space       = var.kvap_address_space
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}

