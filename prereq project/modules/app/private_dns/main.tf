################################################
##                                            ##
##        Private DNS For ACR APPS             ##
##                                            ##
################################################

resource "azurerm_private_dns_zone" "acr_sensor_private_dns" {
  name                = var.acr_sensor_private_dns_name
  resource_group_name = var.app_sensor_resource_group_name
  provider            = azurerm.app
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
}


################################################
##                                            ##
##      Private Vnet Link For ACR APPS        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "acr_sensor_link" {
  name                  = var.acr_sensor_link_name
  resource_group_name   = var.app_sensor_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.acr_sensor_private_dns.name
  virtual_network_id    = var.app_sensor_virtual_network_id
  depends_on = [
    azurerm_private_dns_zone.acr_sensor_private_dns
  ]
  provider = azurerm.app
}

################################################
##                                            ##
##        Private DNS For appservice          ##
##                                            ##
################################################

resource "azurerm_private_dns_zone" "sensor_appservice-dns" {
  name                = var.sensor_appservice_dns_name
  resource_group_name = var.app_sensor_resource_group_name
  provider            = azurerm.app
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )

}


resource "azurerm_private_dns_zone_virtual_network_link" "sensor_appservice_link" {
  name                  = var.sensor_appservice_link_name
  resource_group_name   = var.app_sensor_resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.sensor_appservice-dns.name
  virtual_network_id    = var.app_sensor_virtual_network_id
  depends_on = [
    azurerm_private_dns_zone.sensor_appservice-dns
  ]
  provider = azurerm.app
}


resource "azurerm_private_dns_zone_virtual_network_link" "sensor_link" {
  name                  = var.sensor_link_name #"link-to-vnet" 
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = var.core_private_dns
  virtual_network_id    = var.app_sensor_virtual_network_id
  provider              = azurerm.core
}


################################################
##                                            ##
##      Private Vnet Link For BatchAccount    ##
##                                            ##
################################################

# resource "azurerm_private_dns_zone_virtual_network_link" "sensor_batch_link" {
#   name                  = var.app_batch_link_name #"batch-link-to-sensor-vnet"
#   resource_group_name   = var.core_resource_group_name
#   private_dns_zone_name = var.core_batch_private_dns_name
#   virtual_network_id    = var.app_sensor_vnet_id
#   provider              = azurerm.core
# }

################################################
##                                            ##
##      Private DNS Link For Postgress        ##
##                                            ##
################################################

resource "azurerm_private_dns_zone_virtual_network_link" "sensor_psql_dns_vnet" {
  name                  = var.sensor_psql_dns_vnet_name #"psql-link-to-sensor-vnet"
  resource_group_name   = var.core_resource_group_name
  private_dns_zone_name = var.core_psql_dns_name
  virtual_network_id    = var.app_sensor_vnet_id
  provider              = azurerm.core
}