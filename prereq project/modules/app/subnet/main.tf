################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_WEBAPP_SENSOR     ##
##                                            ##
################################################

resource "azurerm_subnet" "webapp_sensor_subnet" {
  name                              = "${var.webapp_sensor_subnet_name}_${var.environment}"
  resource_group_name               = var.sensor_resource_group_name
  virtual_network_name              = var.app_sensor_vnet_name
  address_prefixes                  = var.webapp_sensor_address_prefix
  private_endpoint_network_policies = "Disabled"
  service_endpoints                 = ["Microsoft.KeyVault", "Microsoft.Storage"]
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  provider = azurerm.app

}


################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_WE_PE_SENSOR      ##
##                                            ##
################################################

resource "azurerm_subnet" "private_endpoint_sensor_subnet" {
  name                              = "${var.private_endpoint_sensor_subnet_name}_${var.environment}"
  resource_group_name               = var.sensor_resource_group_name
  virtual_network_name              = var.app_sensor_vnet_name
  address_prefixes                  = var.private_endpoint_sensor_address_prefix #["10.255.243.32/28"]  # Example address range, adjust as needed
  private_endpoint_network_policies = "Disabled"
  # service_endpoints = ["Microsoft.KeyVault"]
  provider = azurerm.app
}


################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_VM_SENSOR         ##
##                                            ##
################################################

resource "azurerm_subnet" "virtual_machine_sensor_subnet" {
  name                              = "${var.virtual_machine_sensor_subnet_name}_${var.environment}"
  resource_group_name               = var.sensor_resource_group_name
  virtual_network_name              = var.app_sensor_vnet_name
  address_prefixes                  = var.virtual_machine_sensor_address_prefix #["10.255.243.48/28"]  # Example address range, adjust as needed
  private_endpoint_network_policies = "Disabled"
  service_endpoints                 = ["Microsoft.KeyVault", "Microsoft.Storage"]
  timeouts {
    create = "60m" # Adjust as needed
    update = "60m"
    delete = "60m"
  }
  provider = azurerm.app
}


