variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "environment" {}

variable "location" {
  description = "The Azure location where resources will be created"
  type        = string
}

# variable "aks_cluster_id" {
#   description = "The ID of the AKS cluster to integrate AGIC with"
#   type        = string
# }

variable "vnet_id" {
  description = "The ID of the Virtual Network"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet for Application Gateway"
  type        = string
}

variable "appgw_name" {
  description = "The name of the Application Gateway"
  type        = string
}

# variable "agic_identity_name" {
#   description = "The name of the Managed Identity for AGIC"
#   type        = string
# }

variable "cert_password" {
  default = "f356ca8f5a0b2905bdfefeec"
}

# variable "subscription_id" {}
variable "gateway_ip_configuration" {}
variable "sku_name" {}
variable "sku_tier" {}
variable "sku_capacity" {}
variable "frontend_port" {
  default = 80
}
variable "backend_address_pool_name" {
  default = "appgw-backend-pool"
}
variable "backend_http_settings_name" {
  default = "http-settings"
}
variable "cookie_based_affinity" {
  default = "Disabled"
}
variable "backend_http_settings_port" {
  default = 80
}
variable "backend_http_settings_protocol" {
  default = "Http"
}
variable "request_timeout" {
  default = 30
}
variable "frontend_public_ip_configuration_name" {
  default = "appgw-public-frontend-ip"
}
variable "frontend_private_ip_configuration_name" {
  default = "appgw-private-frontend-ip"
}
variable "private_ip_address" {}
variable "frontend_port_name" {
  default = "http-port"
}
variable "frontend_http_listener_protocol" {
  default = "Http"
}

variable "request_routing_rule_name" {
  default = "http-rule"
}
variable "rule_type" {
  default = "Basic"
}
variable "http_listener_name" {
  default = "http-listener"
}

variable "zones" {}
variable "tags" {}
variable "ssl_certificate_name" {}
variable "certfile_path" {}
variable "appgw_public_ip_name" {}