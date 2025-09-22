resource "azurerm_communication_service" "acs" {
  name                = var.acs_name
  resource_group_name = var.resource_group_name
  data_location       = var.data_location
}

resource "azurerm_communication_service_email_domain_association" "acs_email_domain_association" {
  communication_service_id = azurerm_communication_service.acs.id
  email_service_domain_id  = var.email_service_domain_id
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}