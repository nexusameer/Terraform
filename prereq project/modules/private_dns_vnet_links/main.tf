################################################
##                                            ##
##      Private Vnet Link For ACR APPS        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "sensor_acr_dns_vnet_link" {
  name                  = var.sensor_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.acr_private_dns_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}



resource "azurerm_private_dns_zone_virtual_network_link" "sensor_fap_private_dns_zone_name" {
  name                  = var.sensor_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.fap_private_dns_zone_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}


resource "azurerm_private_dns_zone_virtual_network_link" "sensor_key_vault_dns_vnet_link" {
  name                  = var.sensor_link_name #"link-to-vnet" 
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.keyvault_private_dns_zone_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}

resource "azurerm_private_dns_zone_virtual_network_link" "sensor_batch_dns_vnet_link" {
  name                  = var.sensor_link_name #"link-to-vnet" 
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.batch_private_dns_zone_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}

################################################
##                                            ##
##      Private DNS Link For Postgress        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "sensor_psql_dns_vnet_link" {
  name                  = var.sensor_link_name #"psql-link-to-sensor-vnet"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.psql_private_dns_zone_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}




################################################
##                                            ##
##      Private Vnet Link For BatchAccount    ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "batch_dns_vnet_link" {
  name                  = var.core_link_name #"batch-link-to-vnet"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.batch_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}



################################################
##                                            ##
##      Private Vnet Link For ACR             ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "acr_dns_vnet_link" {
  name                  = var.core_link_name #"link-to-vnet-for-acr"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.acr_private_dns_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}


resource "azurerm_private_dns_zone_virtual_network_link" "fap_private_dns_zone_name" {
  name                  = var.core_link_name #"privatelink.file.core.windows.net-link"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.fap_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}

resource "azurerm_private_dns_zone_virtual_network_link" "file_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.file.core.windows.net-link"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.file_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}

resource "azurerm_private_dns_zone_virtual_network_link" "table_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.table.core.windows.net-link"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.table_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}

resource "azurerm_private_dns_zone_virtual_network_link" "queue_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.queue.core.windows.net-link"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.queue_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}


resource "azurerm_private_dns_zone_virtual_network_link" "blob_fap_dns_vnet_link" {
  name                  = var.core_link_name #"privatelink.blob.core.windows.net-link"
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.blob_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity
}



################################################
##                                            ##
##      Private Vnet Link For KeyVault        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "key_vault_dns_vnet_link" {
  name                  = var.core_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.keyvault_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity

}


resource "azurerm_private_dns_zone_virtual_network_link" "psql_dns_vnet_link" {
  name                  = var.core_link_name #"psql-dns-vnet"
  private_dns_zone_name = var.psql_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  resource_group_name   = var.gitlab_resource_group_name
  provider              = azurerm.connectivity
}


################################################
##                                            ##
##      Private DNS Link For blob             ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "sensor_blob_dns_vnet_link" {
  name                  = var.sensor_blob_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.blob_private_dns_zone_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.connectivity
}


################################################
##                                            ##
##      Private Vnet Link For Eventhub        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "core_eventhub_dns_vnet_link" {
  name                  = var.eventhub_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.eventhub_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  provider              = azurerm.connectivity

}

################################################
##                                            ##
##    Private Vnet Link For CH to Eventhub    ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "ch_eventhub_dns_vnet_link" {
  name                  = var.ch_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.eventhub_private_dns_zone_name
  virtual_network_id    = var.ch_vnet_id
  provider              = azurerm.connectivity

}

################################################
##                                            ##
##    Private Vnet Link For CH to Postgresq   ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "psql_eventhub_dns_vnet_link" {
  name                  = var.psql_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.psql_private_dns_zone_name
  virtual_network_id    = var.ch_vnet_id
  provider              = azurerm.connectivity

}

################################################
##                                            ##
##    Private Vnet Link For CH to ACR         ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "acr_eventhub_dns_vnet_link" {
  name                  = var.acr_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.acr_private_dns_name
  virtual_network_id    = var.ch_vnet_id
  provider              = azurerm.connectivity

}

################################################
##                                            ##
##    Private Vnet Link For CH to blob        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "blob_eventhub_dns_vnet_link" {
  name                  = var.blob_link_name
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.blob_private_dns_zone_name
  virtual_network_id    = var.ch_vnet_id
  provider              = azurerm.connectivity

}

resource "azurerm_private_dns_zone_virtual_network_link" "aks_dns_vnet_link_core" {
  name                  = var.aks_link_name_core
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.aks_private_dns_zone_name
  virtual_network_id    = var.core_vnet_id
  registration_enabled  = true
  provider              = azurerm.connectivity

}

resource "azurerm_private_dns_zone_virtual_network_link" "aks_dns_vnet_link_ch" {
  name                  = var.aks_link_name_ch
  resource_group_name   = var.gitlab_resource_group_name
  private_dns_zone_name = var.aks_private_dns_zone_name
  virtual_network_id    = var.ch_vnet_id
  registration_enabled  = true
  provider              = azurerm.connectivity

}