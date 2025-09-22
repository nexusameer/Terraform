resource "azurerm_network_security_group" "kvap_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.kvap_rg_name

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.app
}

resource "azurerm_network_security_rule" "kvap_outbound_rule" {
  name                        = "outbond_rule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.kvap_rg_name
  network_security_group_name = azurerm_network_security_group.kvap_nsg.name

  provider = azurerm.app
}

resource "azurerm_network_security_rule" "kvap_inbound_rule" {
  name                        = "inbond_rule"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.kvap_rg_name
  network_security_group_name = azurerm_network_security_group.kvap_nsg.name

  provider = azurerm.app
}

resource "azurerm_subnet_network_security_group_association" "kvap_vm_subnet" {
  subnet_id = var.kvap_vm_subnet_id
  network_security_group_id = azurerm_network_security_group.kvap_nsg.id
  provider = azurerm.app
}