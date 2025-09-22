data "azurerm_resource_group" "core_rg" {
  provider = azurerm.core
  name     = "${var.core_rg}_${var.environment}"
}

data "azurerm_virtual_network" "core_vnet" {
  provider            = azurerm.core
  name                = "${var.core_vnet}_${var.environment}"
  resource_group_name = data.azurerm_resource_group.core_rg.name
}



data "azurerm_subnet" "core_pe_subnet" {
  provider             = azurerm.core
  name                 = "${var.pe_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}



data "azurerm_subnet" "bastion_subnet" {
  provider             = azurerm.core
  name                 = "AzureBastionSubnet"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}


data "azurerm_subnet" "core_function_app_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_function_app_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}



data "azurerm_subnet" "core_batch_account_subnet" {
  provider             = azurerm.core
  name                 = "${var.batch_account_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_db_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_db_subnet}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}





data "azurerm_private_dns_zone" "acr_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.acr_private_dns_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "psql_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.psql_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "function_app_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.fap_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "file_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.file_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "blob_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.blob_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "table_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.table_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "queue_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.queue_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}



data "azurerm_private_dns_zone" "batch_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.batch_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}







data "azurerm_private_dns_zone" "core_key_vault_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.keyvault_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}

data "azurerm_client_config" "root" {
  provider = azurerm.core
}


data "azurerm_resource_group" "gitlab_rg" {
  provider = azurerm.connectivity
  name     = var.dns_rg
}

data "azurerm_resource_group" "kcri_rg" {
  provider = azurerm.tre
  name     = "${var.kcri_rg}_${var.environment}"
}

data "azurerm_monitor_action_group" "action_group" {
  provider            = azurerm.tre
  name                = "notification_critical_events"           # Ensure this matches the Action Group name
  resource_group_name = data.azurerm_resource_group.kcri_rg.name # Replace with the correct RG name
}


data "azurerm_resource_group" "soc_security_rg" {
  provider = azurerm.management
  name     = "${var.soc_security_rg_name}"
}

data "azurerm_data_protection_backup_vault" "backup_vault" {
  provider            = azurerm.management
  name                = "${var.backup_vault_name}${var.environment}"
  resource_group_name = "${var.soc_security_rg_name}"
}

data "azurerm_log_analytics_workspace" "loganalytics_workspace" {
  provider = azurerm.management
  name                = var.loganalytics_workspace_name
  resource_group_name = data.azurerm_resource_group.soc_security_rg.name

}