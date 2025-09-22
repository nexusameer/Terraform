
data "azurerm_resource_group" "gitlab_rg" {
  provider = azurerm.management
  name     = var.gitlab_resource_group_name
}


data "azurerm_resource_group" "soc_rg" {
  provider = azurerm.management
  name     = var.soc_security_rg_name
}

data "azurerm_resource_group" "dns_rg" {
  provider = azurerm.connectivity
  name     = var.dns_rg_name
}

data "azurerm_private_dns_zone" "acr_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.acr_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_private_dns_zone" "eventhub_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.eventhub_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}


data "azurerm_private_dns_zone" "psql_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.psql_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_private_dns_zone" "aks_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.aks_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}


data "azurerm_private_dns_zone" "function_app_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.fap_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}



data "azurerm_private_dns_zone" "function_app_file_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.file_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}



data "azurerm_private_dns_zone" "function_app_blob_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.blob_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}



data "azurerm_private_dns_zone" "function_app_table_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.table_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}



data "azurerm_private_dns_zone" "function_app_queue_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.queue_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_private_dns_zone" "batch_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.batch_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_private_dns_zone" "key_vault_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.keyvault_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_virtual_network" "gitlab_vnet" {
  name                = var.gitlab_vnet_name
  resource_group_name = var.gitlab_resource_group_name
  provider            = azurerm.management
}

data "azurerm_resource_group" "connectivity_rg" {
  provider = azurerm.connectivity
  name     = var.connectivity_rg_name
}

data "azurerm_virtual_network" "connectivity_vnet" {
  name                = var.connectivity_vnet_name
  resource_group_name = data.azurerm_resource_group.connectivity_rg.name
  provider            = azurerm.connectivity
}

data "azurerm_firewall" "azure_firewall" {
  name                = var.firewall_name
  resource_group_name = data.azurerm_resource_group.connectivity_rg.name
  provider            = azurerm.connectivity
}

data "azurerm_firewall_policy" "firewall_policy" {
  name                = var.firewall_policy_name
  resource_group_name = data.azurerm_resource_group.connectivity_rg.name
  provider            = azurerm.connectivity
}
