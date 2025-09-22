################################################
##                                            ##
##   Container Registery for ACR apps         ##
##                                            ##
################################################

resource "azurerm_container_registry" "sensor_container_registry" {     
  name                = lower("${var.sensor_container_registry_name}${var.environment}")
  resource_group_name = var.sensor_rg_name
  location            = var.sensor_rg_location
  sku                 = var.container_registry_sku
  admin_enabled       = var.admin_enabled  

  public_network_access_enabled = var.public_network_access_enabled

  identity {
    type = var.identity_type
  }

  tags = merge (
    var.tags,
    {
    environment = var.environment 
    }
  )
  provider = azurerm.app
}

################################################
##                                            ##
##      Private Endpoint For ACR APPS         ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "apps_acr_private_endpoint" {
  name                = "${var.az_pe_we_apps_to_cr_we_core}_${var.environment}"
  location            = azurerm_container_registry.sensor_container_registry.location
  resource_group_name = var.sensor_rg_name
  subnet_id           = var.az_snet_we_pe_sensor_id

  # private_dns_zone_group {
  #   name                 = var.acr_private_dns_zone_group_name
  #   private_dns_zone_ids = [var.acr_private_dns_id]
  # }

  private_service_connection {
    name                           = "${var.az_pe_we_apps_to_cr_we_core}_${var.environment}"
    private_connection_resource_id = azurerm_container_registry.sensor_container_registry.id
    is_manual_connection           = var.private_service_connection_type
    subresource_names              = var.subresource_names
  }
  tags = merge (
    var.tags,
    {
    environment = var.environment 
    }
  )
  provider = azurerm.app
}

resource "azurerm_private_dns_a_record" "private_dns_a_record_in_acr" {
  name                = split(".azurecr.io", azurerm_private_endpoint.apps_acr_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.acr_private_dns_name
  resource_group_name = var.gitlab_rg_name
  ttl                 = var.ttl
  records             = azurerm_private_endpoint.apps_acr_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on = [ azurerm_private_endpoint.apps_acr_private_endpoint ]
  tags = merge (
  var.tags,
  {
  environment = var.environment 
  }
  )
  provider = azurerm.connectivity
}

resource "azurerm_private_dns_a_record" "private_dns_data_a_record_in_acr" {
  name                = split(".azurecr.io", azurerm_private_endpoint.apps_acr_private_endpoint.custom_dns_configs[1].fqdn)[0]
  zone_name           = var.acr_private_dns_name
  resource_group_name = var.gitlab_rg_name
  ttl                 = var.ttl
  records = azurerm_private_endpoint.apps_acr_private_endpoint.custom_dns_configs[1].ip_addresses
  depends_on = [ azurerm_private_endpoint.apps_acr_private_endpoint ]
  tags = merge (
    var.tags,
    {
    environment = var.environment 
    }
  )
  provider = azurerm.connectivity
}

################################################
##                                            ##
##      Private DNS Record From ACR App       ##
##                                            ##
################################################

# data "azurerm_private_dns_a_record" "app_private_dns_a_record" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}")
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.sensor_rg_name
#   depends_on          = [azurerm_private_endpoint.apps_acr_private_endpoint, azurerm_container_registry.sensor_container_registry]
#   provider            = azurerm.app
# }

################################################
##                                            ##
##      Private DNS Record For ACR Core       ##
##                                            ##
################################################

# resource "azurerm_private_dns_a_record" "app_private_dns_a_record_in_core_acr" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}") 
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.core_rg_name
#   ttl                 = var.ttl
#   records             = data.azurerm_private_dns_a_record.app_private_dns_a_record.records
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
#   provider = azurerm.core
# }

# ################################################
# ##                                            ##
# ##   Private DNS Data Record From ACR App     ##
# ##                                            ##
# ################################################

# data "azurerm_private_dns_a_record" "app_private_dns_a_record_data" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}.${var.dns_record_westeurope_data}")
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.sensor_rg_name
#   depends_on          = [azurerm_private_endpoint.apps_acr_private_endpoint, azurerm_container_registry.sensor_container_registry]
#   provider            = azurerm.app
# }

# ################################################
# ##                                            ##
# ##   Private DNS Data Record For ACR Core     ##
# ##                                            ##
# ################################################


# resource "azurerm_private_dns_a_record" "app_private_dns_data_a_record_in_core_acr" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}.${var.dns_record_westeurope_data}") 
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.core_rg_name
#   ttl                 = var.ttl
#   records             = data.azurerm_private_dns_a_record.app_private_dns_a_record_data.records
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
#   provider = azurerm.core
# }




######################################FAHAD#############################################
# data "azurerm_network_interface" "apps_acr_private_endpoint_network_interface" {
#   name                = azurerm_private_endpoint.apps_acr_private_endpoint.network_interface[0].name
#   resource_group_name = var.sensor_rg_name
#   provider = azurerm.app
# }



# resource "azurerm_private_dns_a_record" "private_dns_a_record_in_acr" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}.${var.dns_record_westeurope_data}")
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.gitlab_rg_name
#   ttl                 = var.ttl
#   records = [data.azurerm_network_interface.apps_acr_private_endpoint_network_interface.ip_configuration[0].private_ip_address]
#   tags = merge (
#   var.tags,
#   {
#   environment = var.environment 
#   }
#   )
#   provider = azurerm.connectivity
# }

# resource "azurerm_private_dns_a_record" "private_dns_data_a_record_in_acr" {
#   name                = lower("${var.dns_record_azcrweapp}${var.environment}")
#   zone_name           = var.acr_private_dns_name
#   resource_group_name = var.gitlab_rg_name
#   ttl                 = var.ttl
#   records = [data.azurerm_network_interface.apps_acr_private_endpoint_network_interface.ip_configuration[1].private_ip_address]
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
#   provider = azurerm.connectivity
# }
######################################FAHAD#############################################
