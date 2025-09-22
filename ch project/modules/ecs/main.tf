resource "azurerm_email_communication_service" "ecs" {
  name                = var.ecs_name
  resource_group_name = var.azurerm_resource_group
  data_location       = var.data_location
}

resource "azurerm_email_communication_service_domain" "ecs_service_domain" {
  name              = var.ecs_service_domain_name
  email_service_id  = azurerm_email_communication_service.ecs.id
  domain_management = var.domain_management
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}