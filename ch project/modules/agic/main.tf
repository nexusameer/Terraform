# resource "azurerm_user_assigned_identity" "agic_identity" {
#   name                = var.agic_identity_name
#   resource_group_name = var.resource_group_name
#   location            = var.location
# }

# resource "azurerm_role_assignment" "agic_role" {
#   scope                = var.aks_cluster_id
#   role_definition_name = "Contributor"
#   principal_id         = azurerm_user_assigned_identity.agic_identity.principal_id
# }

resource "azurerm_application_gateway" "agic" {
  name = "${var.appgw_name}_${var.environment}"
  # name                = var.appgw_name
  location            = var.location
  resource_group_name = var.resource_group_name
  zones               = var.zones

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = var.gateway_ip_configuration
    subnet_id = var.subnet_id
  }

  frontend_ip_configuration {
    name                 = var.frontend_public_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.appgw_pip.id
  }

  frontend_ip_configuration {
    name                          = var.frontend_private_ip_configuration_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Static"
    private_ip_address            = var.private_ip_address
  }

  frontend_port {
    name = var.frontend_port_name
    port = var.frontend_port
  }

  frontend_port {
    name = "https-port"
    port = 443
  }

  ssl_certificate {
    name     = var.ssl_certificate_name
    data     = filebase64(var.certfile_path)
    password = var.cert_password
  }

  backend_address_pool {
    name = var.backend_address_pool_name
  }

  backend_http_settings {
    name                  = var.backend_http_settings_name
    cookie_based_affinity = var.cookie_based_affinity
    port                  = var.backend_http_settings_port
    protocol              = var.backend_http_settings_protocol
    request_timeout       = var.request_timeout
  }

  http_listener {
    name                           = var.http_listener_name
    frontend_ip_configuration_name = var.frontend_private_ip_configuration_name
    frontend_port_name             = var.frontend_port_name
    protocol                       = var.frontend_http_listener_protocol
  }

  http_listener {
    name                           = "https-listener"
    frontend_ip_configuration_name = var.frontend_private_ip_configuration_name
    frontend_port_name             = "https-port"
    protocol                       = "Https"
    ssl_certificate_name           = var.ssl_certificate_name
  }

  request_routing_rule {
    name                       = var.request_routing_rule_name
    rule_type                  = var.rule_type
    http_listener_name         = var.http_listener_name
    backend_address_pool_name  = var.backend_address_pool_name
    backend_http_settings_name = var.backend_http_settings_name
    priority                   = 100
  }

  # request_routing_rule {
  #   name                       = "https-rule"
  #   rule_type                  = "Basic"
  #   http_listener_name         = "https-listener"
  #   backend_address_pool_name  = var.backend_address_pool_name
  #   backend_http_settings_name = var.backend_http_settings_name
  # }

  # request_routing_rule {
  #   name                       = "http-redirect-rule"
  #   rule_type                  = "Basic"
  #   http_listener_name         = var.http_listener_name
  #   redirect_configuration_name = "https-redirect"
  # }

  # redirect_configuration {
  #   name                        = "https-redirect"
  #   redirect_type               = "Permanent"
  #   target_listener_name        = "https-listener"
  #   include_path                = true
  #   include_query_string        = true
  # }

  tags = var.tags

  lifecycle {
    ignore_changes = [
      frontend_port,
      backend_address_pool,
      backend_http_settings,
      http_listener,
      probe,
      request_routing_rule,
      redirect_configuration,
      url_path_map,
      rewrite_rule_set,
      ssl_certificate,
      tags,
    ]
  }
}

# resource "azurerm_kubernetes_cluster_extension" "agic" {
#   provider       = azurerm.apps
#   name           = "agic-extension"
#   cluster_id     = var.aks_cluster_id
#   extension_type = "Microsoft.Azure.ApplicationGatewayIngress"

#   configuration_settings = {
#     "appgw-subscription-id" = var.subscription_id
#     "appgw-resource-group"  = var.resource_group_name
#     "appgw-name"            = var.appgw_name
#     "watchNamespace"        = "default"
#   }
# }

resource "azurerm_public_ip" "appgw_pip" {
  name = "${var.appgw_public_ip_name}_${var.environment}"
  # name                = "AZ_APPGW_WE_PUBLIC_IP"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"
  zones               = var.zones
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}