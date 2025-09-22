resource "azurerm_container_registry" "azcrwedpcore" {
  provider            = azurerm.core
  name                = var.acr_name
  resource_group_name = var.core_rg
  location            = var.core_rg_location
  sku                 = "Premium"
  admin_enabled       = true
  network_rule_set {
    default_action = "Deny"
  }
  public_network_access_enabled = false
  identity {
    type = "SystemAssigned"
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )

}




################################################
##                                            ##
##      Private Endpoint For ACR              ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "acr_private_endpoint" {
  provider            = azurerm.core
  name                = var.connection_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = var.connection_name
    private_connection_resource_id = azurerm_container_registry.azcrwedpcore.id
    is_manual_connection           = "false"
    subresource_names              = ["registry"]
  }
  depends_on = [azurerm_container_registry.azcrwedpcore]
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_private_dns_a_record" "acr_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".azurecr.io", azurerm_private_endpoint.acr_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.acr_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.acr_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.acr_private_endpoint]
}

resource "azurerm_private_dns_a_record" "acr_private_dns_we" {
  provider            = azurerm.connectivity
  name                = split(".azurecr.io", azurerm_private_endpoint.acr_private_endpoint.custom_dns_configs[1].fqdn)[0]
  zone_name           = var.acr_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.acr_private_endpoint.custom_dns_configs[1].ip_addresses
  depends_on          = [azurerm_private_endpoint.acr_private_endpoint]
}

resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.acr_private_endpoint, azurerm_private_dns_a_record.acr_private_dns, azurerm_private_dns_a_record.acr_private_dns_we]
  create_duration = "60s"
}


