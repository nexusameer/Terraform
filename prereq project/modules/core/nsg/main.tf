resource "azurerm_network_security_group" "core_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.core_resource_group_name

  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

resource "azurerm_network_security_rule" "core_outbound_rule" {
  name                        = "outbond_rule"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.core_resource_group_name
  network_security_group_name = azurerm_network_security_group.core_nsg.name

  provider = azurerm.core
}

resource "azurerm_network_security_rule" "core_inbound_rule" {
  name                        = "inbond_rule"
  priority                    = 200
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.core_resource_group_name
  network_security_group_name = azurerm_network_security_group.core_nsg.name

  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "sensor_db_subnet" {
  subnet_id = var.sensor_db_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "sensor_pe_subnet" {
  subnet_id = var.sensor_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "sensor_batch_account_subnet" {
  subnet_id = var.sensor_batch_account_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "sensor_functionapp_subnet" {
  subnet_id = var.sensor_functionapp_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "ml_pe_subnet" {
  subnet_id = var.ml_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "sensor_bastion_subnet" {
  subnet_id = var.sensor_bastion_subnet_id  
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "ml_batch_account_subnet" {
  subnet_id = var.ml_batch_account_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "ml_function_app_subnet" {
  subnet_id = var.ml_function_app_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}


resource "azurerm_subnet_network_security_group_association" "lss_batch_account_subnet" {
  subnet_id = var.lss_batch_account_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "lss_pe_subnet" {
  subnet_id = var.lss_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "inv_vm_subnet" {
  subnet_id = var.inv_vm_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "inv_db_subnet" {
  subnet_id = var.inv_db_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "inv_function_app_subnet" {
  subnet_id = var.inv_function_app_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "inv_pe_subnet" {
  subnet_id = var.inv_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "event_hub_pe_subnet" {
  subnet_id = var.event_hub_pe_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}

resource "azurerm_subnet_network_security_group_association" "lss_function_app_subnet" {
  subnet_id = var.lss_function_app_subnet_id
  network_security_group_id = azurerm_network_security_group.core_nsg.id
  provider = azurerm.core
}