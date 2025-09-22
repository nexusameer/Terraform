################################################
##                                            ##
##             App Resource Group             ##
##                                            ##
################################################

data "azurerm_resource_group" "az_rg_we_sensor" {
  name     = "${var.resource_group_name_sensor}_${var.environment}"
  provider = azurerm.app
}


################################################
##                                            ##
##             Core Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "core_rg" {
  name     = "${var.resource_group_name_core}_${var.environment}"
  provider = azurerm.core
}

################################################
##                                            ##
##             Key vault                      ##
##                                            ##
################################################

data "azurerm_key_vault" "az-kv-we-core" {
  name                = "${var.az-kv-we-core}-${var.environment}"
  resource_group_name = data.azurerm_resource_group.core_rg.name
  provider            = azurerm.core
}

################################################
##                                            ##
##             App vnet                       ##
##                                            ##
################################################

data "azurerm_virtual_network" "az_vnet_we_sensor_dashboard" {
  name                = "${var.az_vnet_we_sensor_dashboard}_${var.environment}"
  resource_group_name = data.azurerm_resource_group.az_rg_we_sensor.name
  provider            = azurerm.app
}

################################################
##                                            ##
##             App subnet                     ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_pe_sensor" {
  name                 = "${var.az_snet_we_pe_sensor}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
  virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
  provider             = azurerm.app
}

################################################
##                                            ##
##          App subnet for webapp             ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_webapp_sensor" {
  name                 = "${var.az_snet_we_webapp_sensor}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
  virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
  provider             = azurerm.app
}

################################################
##                                            ##
##          App subnet for vm sensor          ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_vm_sensor" {
  name                 = "${var.az_snet_we_vm_sensor}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
  virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
  provider             = azurerm.app
}

################################################
##                                            ##
##          App private dns                   ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "sensor_appservice_private_dns" {
#   name                = var.private_dns_zone_name_webapp
#   resource_group_name = data.azurerm_resource_group.az_rg_we_sensor.name
#   provider            = azurerm.app
# }

################################################
##                                            ##
##      Private dns for acr app               ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "app_acr_private_dns" {
#   name                = var.acr_private_dns_name
#   resource_group_name = data.azurerm_resource_group.az_rg_we_sensor.name
#   provider            = azurerm.app
# }

################################################
##                                            ##
##      Private dns for core acr              ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "core_acr_private_dns" {
#   name                = var.acr_private_dns_name
#   resource_group_name = data.azurerm_resource_group.core_rg.name
#   provider            = azurerm.core
# }

################################################
##                                            ##
##   Private dns for core to apppservice      ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "core_appservice_private_dns" {
#   name                = var.private_dns_zone_name_webapp
#   resource_group_name = data.azurerm_resource_group.core_rg.name
#   provider            = azurerm.core
# }

################################################
##                                            ##
##             KCRI Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "kcri_rg" {
  provider = azurerm.kcri
  name     = "${var.resource_group_name_kcri}_${var.environment}"
}

################################################
##                                            ##
##                 Action Group               ##
##                                            ##
################################################

data "azurerm_monitor_action_group" "action_group" {
  provider            = azurerm.kcri
  name                = var.action_group_name           
  resource_group_name = data.azurerm_resource_group.kcri_rg.name 
}


################################################
##                                            ##
##           Gitlab Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "gitlab_rg" {
  name     = var.resource_group_name_gitlab
  provider = azurerm.connectivity
}

################################################
##                                            ##
##        Security Resource Group             ##
##                                            ##
################################################

data "azurerm_resource_group" "soc_security_rg" {
  provider = azurerm.management
  name     = "${var.soc_security_rg_name}"
}

################################################
##                                            ##
##              Private dns                   ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "appservice_private_dns" {
  name                = var.private_dns_zone_name_webapp
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
  provider            = azurerm.connectivity
}

################################################
##                                            ##
##         Private dns for acr                ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "acr_private_dns" {
  name                = var.acr_private_dns_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
  provider            = azurerm.connectivity
}


data "azurerm_data_protection_backup_vault" "backup_vault" {
  provider            = azurerm.management
  name                = "${var.backup_vault_name}${var.environment}"
  resource_group_name = data.azurerm_resource_group.soc_security_rg.name
}


data "azurerm_log_analytics_workspace" "loganalytics_workspace" {
  provider = azurerm.management
  name                = var.loganalytics_workspace_name
  resource_group_name = data.azurerm_resource_group.soc_security_rg.name

}
