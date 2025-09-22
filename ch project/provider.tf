# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 4.14.0"
#     }

#   }
# }


terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.29.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.36.0"
    }
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "18.1.1"
    }

  }
  backend "azurerm" {
    resource_group_name  = "AZ_RG_WE_IACSTATE"      # manual changes
    storage_account_name = "azsaweiacstateshared"   # manual changes
    container_name       = "azure-iac-ch-container" # manual changes

  }
}

provider "azuread" {
  alias = "apps"
}

provider "azurerm" {
  features {}
  alias           = "apps"
  subscription_id = var.apps_subscription_id
}

provider "azurerm" {
  features {}
  alias           = "core"
  subscription_id = var.core_subscription_id
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

# provider "kubernetes" {
#   host                   = module.aks.kube_config[0].host
#   username               = module.aks.kube_config[0].username
#   password               = module.aks.kube_config[0].password
#   client_certificate     = base64decode(module.aks.kube_config[0].client_certificate)
#   client_key             = base64decode(module.aks.kube_config[0].client_key)
#   cluster_ca_certificate = base64decode(module.aks.kube_config[0].cluster_ca_certificate)
# }


provider "gitlab" {
  alias    = "kaust_gitlab"
  token    = var.CH_ACCESS_TOKEN
  base_url = var.gitlab_url
}
