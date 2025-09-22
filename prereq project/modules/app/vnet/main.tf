resource "azurerm_virtual_network" "sensor_vnet" {
  name                = "${var.sensor_vnet_name}_${var.environment}"
  address_space       = var.sensor_vnet_address_space
  location            = var.sensor_resource_group_location
  resource_group_name = var.sensor_resource_group_name
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}


