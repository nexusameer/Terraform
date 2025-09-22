terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "AZ_RG_WE_IACSTATE"          # manual changes
    storage_account_name = "azsaweiacstateshared"       # manual changes
    container_name       = "azure-iac-prereq-container" # manual changes

  }
}

provider "azurerm" {
  alias = "core"
  features {}
  subscription_id = var.core_subscription_id

}

provider "azurerm" {
  alias = "app"
  features {}
  subscription_id = var.app_subscription_id
}

provider "azurerm" {
  alias = "management"
  features {}
  subscription_id = var.management_subscription_id
}

provider "azurerm" {
  alias = "kcri"
  features {}
  subscription_id = var.kcri_subscription_id
}

provider "azurerm" {
  alias = "connectivity"
  features {}
  subscription_id = var.connectivity_subscription_id
}
