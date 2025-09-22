################################################
##                                            ##
##       SUBNET for Database                  ##
##                                            ##
################################################

resource "azurerm_subnet" "sensor_db_subnet" {
  name                              = "${var.sensor_db_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  address_prefixes                  = var.sensor_db_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  private_endpoint_network_policies = "Disabled"
  provider                          = azurerm.core
  delegation {
    name = "fs"
    service_delegation {
      name = "Microsoft.DBforPostgreSQL/flexibleServers"
      actions = [
        "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}


################################################
##                                            ##
##       SUBNET for  private_endpoint         ##
##                                            ##
################################################

resource "azurerm_subnet" "sensor_pe_subnet" {
  name                              = "${var.sensor_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.sensor_pe_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}

################################################
##                                            ##
##       SUBNET for  AZ_VNET_WE_BA_CORE       ##
##                                            ##
################################################

resource "azurerm_subnet" "sensor_batch_account_subnet" {
  name                              = "${var.sensor_batch_account_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.sensor_batch_account_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}

################################################
##                                            ##
##       SUBNET for  AZ_VNET_WE_FAP_CORE       ##
##                                            ##
################################################

resource "azurerm_subnet" "sensor_functionapp_subnet" {
  name                              = "${var.sensor_functionapp_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.sensor_functionapp_address_prefix
  provider                          = azurerm.core
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }

}

################################################
##                                            ##
##          SUBNET for  AZ_VNET_BASTION       ##
##                                            ##
################################################

resource "azurerm_subnet" "sensor_bastion_subnet" {
  name                              = var.sensor_bastion_subnet_name
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  address_prefixes                  = var.sensor_bastion_address_prefix
  private_endpoint_network_policies = "Disabled"
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}


################################################
##                                            ##
##      SUBNET for  Data Bricks Container     ##
##                                            ##
################################################

# resource "azurerm_subnet" "d_bricks_container_subnet" {
#   name                              = "${var.d_bricks_container_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_name
#   virtual_network_name              = var.virtual_network_name
#   private_endpoint_network_policies = "Disabled"
#   address_prefixes                  = var.d_bricks_container_address_prefix
#   service_endpoints                 = ["Microsoft.Storage"]
#   provider                          = azurerm.core
# }

################################################
##                                            ##
##      SUBNET for  Data Bricks Host          ##
##                                            ##
################################################

# resource "azurerm_subnet" "d_bricks_host_subnet" {
#   name                              = "${var.d_bricks_host_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_name
#   virtual_network_name              = var.virtual_network_name
#   private_endpoint_network_policies = "Disabled"
#   address_prefixes                  = var.d_bricks_host_address_prefix
#   service_endpoints                 = ["Microsoft.Storage"]
#   provider                          = azurerm.core
# }


################################################
##                                            ##
##      SUBNET for PE Data Bricks CP          ##
##                                            ##
################################################

# resource "azurerm_subnet" "pe_d_bricks_cp_subnet" {
#   name                              = "${var.pe_d_bricks_cp_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_name
#   virtual_network_name              = var.virtual_network_name
#   private_endpoint_network_policies = "Disabled"
#   address_prefixes                  = var.pe_d_bricks_cp_address_prefix
#   service_endpoints                 = ["Microsoft.Storage"]
#   provider                          = azurerm.core
# }

################################################
##                                            ##
##      SUBNET for PE Data Bricks CP          ##
##                                            ##
################################################

# resource "azurerm_subnet" "pe_d_bricks_managed_storage_subnet" {
#   name                              = "${var.pe_d_bricks_managed_storage_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_name
#   virtual_network_name              = var.virtual_network_name
#   private_endpoint_network_policies = "Disabled"
#   address_prefixes                  = var.pe_d_bricks_managed_storage_address_prefix
#   service_endpoints                 = ["Microsoft.Storage"]
#   provider                          = azurerm.core
# }

################################################
##                                            ##
##        SUBNET for ML Batch Account         ##
##                                            ##
################################################

resource "azurerm_subnet" "ml_batch_account_subnet" {
  name                              = "${var.ml_batch_account_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ml_batch_account_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}

################################################
##                                            ##
##        SUBNET for ML Function APP          ##
##                                            ##
################################################

resource "azurerm_subnet" "ml_function_app_subnet" {
  name                              = "${var.ml_function_app_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ml_function_app_address_prefix
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  service_endpoints = ["Microsoft.Storage"]
  provider          = azurerm.core
}

################################################
##                                            ##
##        SUBNET for ML Private Endpoint      ##
##                                            ##
################################################

resource "azurerm_subnet" "ml_pe_subnet" {
  name                              = "${var.ml_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.ml_pe_subnet_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}


################################################
##                                            ##
##        SUBNET for LSS Batch Account        ##
##                                            ##
################################################

resource "azurerm_subnet" "lss_batch_account_subnet" {
  name                              = "${var.lss_batch_account_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.lss_batch_account_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}

################################################
##                                            ##
##        SUBNET for LSS Batch Account        ##
##                                            ##
################################################

resource "azurerm_subnet" "lss_function_app_subnet" {
  name                              = "${var.lss_function_app_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.lss_function_app_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  provider = azurerm.core
}

################################################
##                                            ##
##        SUBNET for LSS Private Endpoint     ##
##                                            ##
################################################

resource "azurerm_subnet" "lss_pe_subnet" {
  name                              = "${var.lss_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.lss_pe_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}


################################################
##                                            ##
##           SUBNET for INV VM                ##
##                                            ##
################################################

resource "azurerm_subnet" "inv_vm_subnet" {
  name                              = "${var.inv_vm_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.inv_vm_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}


################################################
##                                            ##
##           SUBNET for INV DB                ##
##                                            ##
################################################

resource "azurerm_subnet" "inv_db_subnet" {
  name                              = "${var.inv_db_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.inv_db_address_prefix
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
  provider = azurerm.core
}

################################################
##                                            ##
##        SUBNET for INV Function APP         ##
##                                            ##
################################################

resource "azurerm_subnet" "inv_function_app_subnet" {
  name                              = "${var.inv_function_app_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.inv_function_app_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  delegation {
    name = "example-delegation"

    service_delegation {
      name    = "Microsoft.Web/serverFarms"
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
    }
  }
  provider = azurerm.core
}

################################################
##                                            ##
##        SUBNET for INV Private Endpoint     ##
##                                            ##
################################################

resource "azurerm_subnet" "inv_pe_subnet" {
  name                              = "${var.inv_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.inv_pe_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}

################################################
##                                            ##
##            SUBNET for Event Hub            ##
##                                            ##
################################################

resource "azurerm_subnet" "event_hub_pe_subnet" {
  name                              = "${var.event_hub_pe_subnet_name}_${var.environment}"
  resource_group_name               = var.resource_group_name
  virtual_network_name              = var.virtual_network_name
  private_endpoint_network_policies = "Disabled"
  address_prefixes                  = var.event_hub_address_prefix
  service_endpoints                 = ["Microsoft.Storage"]
  provider                          = azurerm.core
}
























################################################
##                                            ##
##       SUBNET for CH Database               ##
##                                            ##
################################################

# resource "azurerm_subnet" "ch_db_subnet" {
#   name                              = "${var.db_ch_subnet_name}_${var.environment}"
#   resource_group_name               = var.resource_group_name
#   virtual_network_name              = var.virtual_network_name
#   address_prefixes                  = var.database_ch_address_prefix
#   service_endpoints                 = ["Microsoft.Storage"]
#   private_endpoint_network_policies = "Disabled"
#   provider                          = azurerm.core
#   delegation {
#     name = "fs"
#     service_delegation {
#       name = "Microsoft.DBforPostgreSQL/flexibleServers"
#       actions = [
#         "Microsoft.Network/virtualNetworks/subnets/join/action",
#       ]
#     }
#   }
# }