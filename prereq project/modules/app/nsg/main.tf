resource "azurerm_network_security_group" "app_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.app_resource_group_name

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}

resource "azurerm_network_security_rule" "app_outbound_rule" {
  name                        = "outbond_rule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.app_resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name

  provider = azurerm.app
}

resource "azurerm_network_security_rule" "app_inbound_rule" {
  name                        = "inbond_rule"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.app_resource_group_name
  network_security_group_name = azurerm_network_security_group.app_nsg.name

  provider = azurerm.app
}

resource "azurerm_subnet_network_security_group_association" "webapp_sensor_subnet" {
  subnet_id = var.webapp_sensor_subnet_id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
  provider = azurerm.app
}
resource "azurerm_subnet_network_security_group_association" "private_endpoint_sensor_subnet" {
  subnet_id = var.private_endpoint_sensor_subnet_id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
  provider = azurerm.app
}
resource "azurerm_subnet_network_security_group_association" "virtual_machine_sensor_subnet" {
  subnet_id = var.virtual_machine_sensor_subnet_id
  network_security_group_id = azurerm_network_security_group.app_nsg.id
  provider = azurerm.app
}


