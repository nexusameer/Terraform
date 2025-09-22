resource "azurerm_service_plan" "function_app_plan" {
  provider            = azurerm.core
  name                = var.service_plan_name
  location            = var.location
  resource_group_name = var.core_rg_name
  os_type             = "Linux"
  sku_name            = "EP1" # Elastic Premium Plan
  # sku_name            = "P1v3"
  # premium_plan_auto_scale_enabled = var.premium_plan_auto_scale_enabled
  maximum_elastic_worker_count = var.maximum_elastic_worker_count
  worker_count                 = var.worker_count
  tags = {
    environment  = var.environment
    "Created By" = var.created_by
  }
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core
      ]
    }
  }
}