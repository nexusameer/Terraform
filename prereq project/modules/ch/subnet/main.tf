################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_AKS_CH            ##
##                                            ##
################################################

resource "azurerm_subnet" "aks_ch_subnet" {
  name                              = "${var.aks_ch_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_ch_name
  virtual_network_name              = var.vnet_ch_name
  address_prefixes                  = var.aks_ch_address_prefix
  private_endpoint_network_policies = "Disabled"
  service_endpoints                 = ["Microsoft.EventHub"]
  provider                          = azurerm.app

}


################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_PE_CH             ##
##                                            ##
################################################

# resource "azurerm_subnet" "private_endpoint_ch_subnet" {
#   name                              = "${var.private_endpoint_ch_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_ch_name
#   virtual_network_name              = var.vnet_ch_name
#   address_prefixes                  = var.ch_pe_address_prefix #["10.255.243.32/28"]  # Example address range, adjust as needed
#   private_endpoint_network_policies = "Disabled"
#   provider                          = azurerm.app
# }


################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_FAP_CH            ##
##                                            ##
################################################

# resource "azurerm_subnet" "function_app_ch_subnet" {
#   name                              = "${var.function_app_ch_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_ch_name
#   virtual_network_name              = var.vnet_ch_name
#   address_prefixes                  = var.function_app_ch_address_prefix
#   private_endpoint_network_policies = "Disabled"
#   provider                          = azurerm.app
# }

################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_ML_CH             ##
##                                            ##
################################################

# resource "azurerm_subnet" "machine_learning_ch_subnet" {
#   name                              = "${var.machine_learning_ch_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_ch_name
#   virtual_network_name              = var.vnet_ch_name
#   address_prefixes                  = var.machine_learning_ch_address_prefix
#   private_endpoint_network_policies = "Disabled"
#   provider                          = azurerm.app
# }

################################################
##                                            ##
##   Subnet for  AZ_SNET_WE_VM_CH             ##
##                                            ##
################################################

# resource "azurerm_subnet" "virtual_machine_ch_subnet" {
#   name                              = "${var.virtual_machine_ch_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_ch_name
#   virtual_network_name              = var.vnet_ch_name
#   address_prefixes                  = var.virtual_machine_ch_address_prefix
#   private_endpoint_network_policies = "Disabled"
#   provider                          = azurerm.app
# }


################################################
##                                            ##
##         SUBNET for CH  DB  Subnet         ##
##                                            ##
################################################

resource "azurerm_subnet" "ch_db_subnet" {
  name                              = "${var.ch_db_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_ch_name
  virtual_network_name              = var.vnet_ch_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ch_db_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
  provider = azurerm.app
}

################################################
##                                            ##
##         SUBNET for CH  PE  Subnet          ##
##                                            ##
################################################

resource "azurerm_subnet" "ch_pe_subnet" {
  name                              = "${var.ch_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_ch_name
  virtual_network_name              = var.vnet_ch_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ch_pe_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.app
}

################################################
##                                            ##
##      SUBNET for CH APPGATEWAY Subnet       ##
##                                            ##
################################################

resource "azurerm_subnet" "ch_appgtw_subnet" {
  name                              = "${var.ch_appgtw_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_ch_name
  virtual_network_name              = var.vnet_ch_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ch_appgtw_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.app
}