################################################
##                                            ##
##             App service plan               ##
##                                            ##
################################################

resource "azurerm_app_service_plan" "sensor_app_service_plan" {
  name                = "${var.sensor_app_service_plan_name}-${var.environment}"
  location            = var.sensor_rg_location
  resource_group_name = var.sensor_rg_name
  kind                = var.app_service_plan_kind
  reserved            = var.app_service_reserved_field 
  sku {
    tier = var.app_service_plan_sku_tier
    size = var.app_service_plan_sku_size
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
##       Role assignment for app              ##
##                                            ##
################################################

resource "azurerm_role_assignment" "acr_pull_role" {
  principal_id         = azurerm_app_service.sensor_app_service.identity[0].principal_id
  role_definition_name = var.acr_role_definition_name
  scope                = var.container_registry_id
  provider             = azurerm.app
}

################################################
##                                            ##
##          Sensor App service                ##
##                                            ##
################################################

resource "azurerm_app_service" "sensor_app_service" {
  name                = "${var.app_service_name}-${var.environment}"
  location            = var.sensor_rg_location
  resource_group_name = var.sensor_rg_name
  app_service_plan_id = azurerm_app_service_plan.sensor_app_service_plan.id
  site_config {
    always_on                            = var.always_on
    http2_enabled                        = var.http2_enabled
    ftps_state                           = var.ftps_state
    linux_fx_version                     = "DOCKER|${var.container_registry_name}.azurecr.io/${var.image_name}:${var.image_tag}"
    acr_use_managed_identity_credentials = var.acr_use_managed_identity_credentials
    vnet_route_all_enabled               = var.vnet_route_all_enabled
  }
  app_settings = {
    "KEYVAULT_NAME"      = var.key_vault_name
    "KEYVAULT_URL"       = var.key_vault_url
  }
  identity {
    type = var.identity_type
  }
  auth_settings {
    enabled = var.auth_settings_enabled
  }
  lifecycle {
    ignore_changes = [
      site_config[0].linux_fx_version,
      app_settings
    ]
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
##  Null Resource to setup VNET image pull    ##
##                                            ##
################################################

resource "null_resource" "enable_vnet_image_pull" {
  provisioner "local-exec" { 
    command = <<-EOT
    az account set --subscription ${var.app_subscription_id} && az resource update --name ${azurerm_app_service.sensor_app_service.name} --resource-group ${var.sensor_rg_name} --resource-type Microsoft.Web/sites/config --set properties.vnetImagePullEnabled=true
    EOT
  }
  triggers = {
    always_run = timestamp()
  }
  depends_on = [
    azurerm_app_service.sensor_app_service
  ]
}

################################################
##                                            ##
##   Role assignment for app to Keyvault      ##
##                                            ##
################################################

resource "azurerm_role_assignment" "app_service_keyvault_role" {
  principal_id         = azurerm_app_service.sensor_app_service.identity[0].principal_id
  role_definition_name = var.app_service_keyvault_role_name
  scope                = var.keyvault_core_id
  provider             = azurerm.app
}

################################################
##                                            ##
##     Private endpoint for App               ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "app_service_private_endpoint" {
  name                = "${var.app_service_private_endpoint_name}_${var.environment}"
  location            = var.sensor_rg_location
  resource_group_name = var.sensor_rg_name
  subnet_id           = var.az_snet_we_pe_sensor_id
  # private_dns_zone_group {
  #   name                 = var.private_dns_zone_group_name
  #   private_dns_zone_ids = [var.appservice_private_dns_id]
  # }
  private_service_connection {
    name                           = "${var.private_service_connection_name}__${var.environment}-psc"
    private_connection_resource_id = azurerm_app_service.sensor_app_service.id
    is_manual_connection           = false
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

resource "azurerm_private_dns_a_record" "private_dns_a_record_in_app_service" {
  name                = split(".azurewebsites.net", azurerm_private_endpoint.app_service_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.appservice_private_dns_name
  resource_group_name = var.gitlab_rg_name
  ttl                 = var.ttl
  records             = azurerm_private_endpoint.app_service_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on = [ azurerm_private_endpoint.app_service_private_endpoint ]
  tags = merge (
  var.tags,
  {
  environment = var.environment 
  }
  )
  provider = azurerm.connectivity
}

resource "azurerm_private_dns_a_record" "private_dns_a_record_in_app_service_scm" {
  name                = split(".azurewebsites.net", azurerm_private_endpoint.app_service_private_endpoint.custom_dns_configs[1].fqdn)[0]
  zone_name           = var.appservice_private_dns_name
  resource_group_name = var.gitlab_rg_name
  ttl                 = var.ttl
  records             = azurerm_private_endpoint.app_service_private_endpoint.custom_dns_configs[1].ip_addresses
  depends_on = [ azurerm_private_endpoint.app_service_private_endpoint ]
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
##       Swift connection for App             ##
##                                            ##
################################################

resource "azurerm_app_service_virtual_network_swift_connection" "app_service_vnet_integration" {
  app_service_id = azurerm_app_service.sensor_app_service.id
  subnet_id      = var.az_snet_we_webapp_sensor_id
  provider       = azurerm.app
}



######################################FAHAD#############################################
# data "azurerm_network_interface" "apps_private_endpoint_network_interface" {
#   name                = azurerm_private_endpoint.app_service_private_endpoint.network_interface[0].name
#   resource_group_name = var.sensor_rg_name
#   provider = azurerm.app
# }

# resource "azurerm_private_dns_a_record" "private_dns_a_record_in_app_acr" {
#   name                = lower("${var.app_service_name}${var.environment}")
#   zone_name           = var.appservice_private_dns_name
#   resource_group_name = var.gitlab_rg_name
#   ttl                 = var.ttl
#   records = [data.azurerm_network_interface.apps_private_endpoint_network_interface.ip_configuration[0].private_ip_address]
#   tags = merge (
#   var.tags,
#   {
#   environment = var.environment 
#   }
#   )
#   provider = azurerm.connectivity
# }
######################################FAHAD#############################################


# resource "azurerm_private_dns_a_record" "private_dns_data_a_record_in_app_acr" {
#   name                = lower("${var.app_service_name}${var.environment}.scm")
#   zone_name           = var.appservice_private_dns_name
#   resource_group_name = var.gitlab_rg_name
#   ttl                 = var.ttl
#   records = [data.azurerm_network_interface.apps_private_endpoint_network_interface.ip_configuration[1].private_ip_address]
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
#   provider = azurerm.connectivity
# }


