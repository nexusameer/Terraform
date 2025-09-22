################################################
##                                            ##
##        internet Route Table                ##
##                                            ##
################################################

resource "azurerm_route_table" "route_table_app" {
  name                = "${var.app_route_table_name}_${var.environment}"
  location            = var.app_sensor_resource_group_location
  resource_group_name = var.app_sensor_resource_group_name

  route {
    name                   = var.app_route
    address_prefix         = var.app_route_address_prefix
    next_hop_type          = var.app_next_hop_type
    next_hop_in_ip_address = var.app_next_hop_ip_address
  }

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )

  provider = azurerm.app

}

resource "azurerm_subnet_route_table_association" "route_table_subnet_pe_sensor" {
  subnet_id      = var.private_endpoint_sensor_subnet_id
  route_table_id = azurerm_route_table.route_table_app.id
  provider       = azurerm.app
}
resource "azurerm_subnet_route_table_association" "core_route_table_subnet_webapp_sensor" {
  subnet_id      = var.webapp_sensor_subnet_id
  route_table_id = azurerm_route_table.route_table_app.id
  provider       = azurerm.app
}

resource "azurerm_subnet_route_table_association" "route_table_subnet_vm_sensor" {
  subnet_id      = var.virtual_machine_sensor_subnet_id
  route_table_id = azurerm_route_table.route_table_app.id
  provider       = azurerm.app
}