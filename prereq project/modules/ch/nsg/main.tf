resource "azurerm_network_security_group" "ch_nsg" {
  name                = var.nsg_name
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

resource "azurerm_network_security_rule" "ch_outbound_rule" {
  name                        = "outbond_rule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_ch_name
  network_security_group_name = azurerm_network_security_group.ch_nsg.name

  provider = azurerm.app
}

resource "azurerm_network_security_rule" "ch_inbound_rule" {
  name                        = "inbond_rule"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_ch_name
  network_security_group_name = azurerm_network_security_group.ch_nsg.name

  provider = azurerm.app
}


resource "azurerm_subnet_network_security_group_association" "aks_ch_subnet" {
  subnet_id = var.aks_ch_subnet_id
  network_security_group_id = azurerm_network_security_group.ch_nsg.id
  provider = azurerm.app
}

resource "azurerm_subnet_network_security_group_association" "ch_db_subnet" {
  subnet_id = var.ch_db_subnet_id
  network_security_group_id = azurerm_network_security_group.ch_nsg.id
  provider = azurerm.app
}

resource "azurerm_subnet_network_security_group_association" "ch_pe_subnet" {
  subnet_id = var.ch_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.ch_nsg.id
  provider = azurerm.app
}

resource "azurerm_subnet_network_security_group_association" "ch_appgtw_subnet" {
  subnet_id = var.ch_appgtw_subnet_id
  network_security_group_id = azurerm_network_security_group.ch_nsg.id
  provider = azurerm.app
}
