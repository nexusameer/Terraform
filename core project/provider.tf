terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "AZ_RG_WE_IACSTATE"        # manual changes
    storage_account_name = "azsaweiacstateshared"     # manual changes
    container_name       = "azure-iac-core-container" # manual changes

  }
}



provider "azurerm" {
  features {}
  alias           = "core"
  subscription_id = var.core_subscription_id

}

provider "azurerm" {
  features {}
  alias           = "apps"
  subscription_id = var.apps_subscription_id

}

provider "azurerm" {
  alias = "tre"
  features {}
  subscription_id = var.tre_subscription_id
}

provider "azurerm" {
  alias = "connectivity"
  features {}
  subscription_id = var.connectivity_subscription_id
}

provider "azurerm" {
  alias = "management"
  features {}
  subscription_id = var.management_subscription_id
}
