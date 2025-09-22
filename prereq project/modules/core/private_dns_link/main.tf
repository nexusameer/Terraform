


################################################
##                                            ##
##      Private Vnet Link For BatchAccount    ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "batch_dns_vnet_link" {
  name                  = var.core_link_name #"batch-link-to-vnet"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.batch_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}



################################################
##                                            ##
##      Private Vnet Link For ACR             ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "acr_dns_vnet_link" {
  name                  = var.core_link_name #"link-to-vnet-for-acr"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.acr_private_dns_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}


resource "azurerm_private_dns_zone_virtual_network_link" "fap_private_dns_zone_name" {
  name                  = var.core_link_name #"privatelink.file.core.windows.net-link"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.fap_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}

resource "azurerm_private_dns_zone_virtual_network_link" "file_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.file.core.windows.net-link"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.file_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}

resource "azurerm_private_dns_zone_virtual_network_link" "table_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.table.core.windows.net-link"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.table_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}

resource "azurerm_private_dns_zone_virtual_network_link" "queue_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.queue.core.windows.net-link"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.queue_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}


resource "azurerm_private_dns_zone_virtual_network_link" "blob_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.blob.core.windows.net-link"
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.blob_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security
}



################################################
##                                            ##
##      Private Vnet Link For KeyVault        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault_dns_vnet_link" {
  name                  = var.core_link_name
  resource_group_name   = var.gitlab_rg
  private_dns_zone_name = var.keyvault_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.security

}


resource "azurerm_private_dns_zone_virtual_network_link" "psql_dns_vnet_link" {
  name                  = var.core_link_name #"psql-dns-vnet"
  private_dns_zone_name = var.psql_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  resource_group_name   = var.gitlab_rg
  provider              = azurerm.security
}


