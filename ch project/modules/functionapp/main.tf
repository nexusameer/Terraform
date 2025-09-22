resource "azurerm_linux_function_app" "function_app" {
  provider                                       = azurerm.core
  name                                           = "${var.function_app_name}-${var.environment}"
  location                                       = var.location
  resource_group_name                            = var.core_rg_name
  storage_account_name                           = var.storage_account_name
  storage_account_access_key                     = var.storage_account_key
  service_plan_id                                = var.function_app_plan_id
  public_network_access_enabled                  = false
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  https_only                                     = true
  functions_extension_version                    = "~4"
  app_settings = {
    # "KEYVAULT_NAME" = var.keyvault_name
    # "KEYVAULT_URL"  = var.key_vault_url
    "WEBSITE_CONTENTOVERVNET"  = true
    "WEBSITE_CONTENTSHARE"     = var.file_share_name
    "FUNCTIONS_WORKER_RUNTIME" = "python"
    "WEBSITE_RUN_FROM_PACKAGE" = "1"
  }
  site_config {
    vnet_route_all_enabled    = true
    elastic_instance_minimum  = var.elastic_instance_minimum
    pre_warmed_instance_count = var.pre_warmed_instance_count
    worker_count              = var.worker_count
    ftps_state                = "FtpsOnly"
    application_stack {
      python_version = "3.11"
    }
  }
  identity {
    type = "SystemAssigned"
  }
  lifecycle {
    ignore_changes = [
      virtual_network_subnet_id,
      app_settings
    ]
    create_before_destroy = true
  }
  tags = {
    environment  = var.environment
    "Created By" = var.created_by
  }
}

resource "azurerm_role_assignment" "function_app_keyvault_role" {
  principal_id         = azurerm_linux_function_app.function_app.identity[0].principal_id
  role_definition_name = var.lss_functioapp_keyvault_role_name
  scope                = var.keyvault_core_id
  provider             = azurerm.core
}

resource "azurerm_role_assignment" "acr_pull_access" {
  provider             = azurerm.core
  scope                = var.core_acr_name
  role_definition_name = "AcrPull"
  principal_id         = azurerm_linux_function_app.function_app.identity[0].principal_id
}



resource "azurerm_app_service_virtual_network_swift_connection" "fapp_vnet" {
  provider       = azurerm.core
  app_service_id = azurerm_linux_function_app.function_app.id
  subnet_id      = var.function_app_subnet_id
  depends_on     = [azurerm_linux_function_app.function_app]
}




resource "azurerm_private_endpoint" "function_app_private_endpoint" {
  provider            = azurerm.core
  name                = var.function_app_pe_name
  location            = var.location
  resource_group_name = var.core_rg_name
  subnet_id           = var.pe_subnet_id

  private_service_connection {
    name                           = "AZ_PE_WE_CORE_TO_FAP_CORE"
    private_connection_resource_id = azurerm_linux_function_app.function_app.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_linux_function_app.function_app]
}

resource "azurerm_private_dns_a_record" "fap_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".azurewebsites.net", azurerm_private_endpoint.function_app_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.function_app_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.function_app_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.function_app_private_endpoint]
}

resource "azurerm_private_dns_a_record" "fap_scm_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".azurewebsites.net", azurerm_private_endpoint.function_app_private_endpoint.custom_dns_configs[1].fqdn)[0]
  zone_name           = var.function_app_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.function_app_private_endpoint.custom_dns_configs[1].ip_addresses
  depends_on          = [azurerm_private_endpoint.function_app_private_endpoint]
}


# resource "azurerm_linux_function_app" "inv_function_app" {
#   provider                                       = azurerm.core
#   name                                           = lower("${var.inv_function_app_name}-${var.environment}")
#   location                                       = var.location
#   resource_group_name                            = var.core_rg_name
#   storage_account_name                           = var.storage_account_name
#   storage_account_access_key                     = var.storage_account_key
#   service_plan_id                                = azurerm_service_plan.function_app_plan.id
#   public_network_access_enabled                  = false
#   ftp_publish_basic_authentication_enabled       = false
#   webdeploy_publish_basic_authentication_enabled = false
#   https_only                                     = true
#   app_settings = {
#     # "KEYVAULT_NAME" = var.keyvault_name
#     # "KEYVAULT_URL"  = var.key_vault_url
#     "WEBSITE_CONTENTOVERVNET" = true
#     "WEBSITE_CONTENTSHARE" = var.inv_file_share_name
#   }
#   site_config {
#     vnet_route_all_enabled = true
#     ftps_state             = "FtpsOnly"
#     application_stack {
#       python_version = "3.11"
#     }
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   lifecycle {
#     ignore_changes = [
#       virtual_network_subnet_id,
#       app_settings
#     ]
#   }
#   tags = {
#     environment  = var.environment
#     "Created By" = var.created_by
#   }
# }

# resource "azurerm_linux_function_app" "water_chemistry_function_app" {
#   provider                                       = azurerm.core
#   name                                           = lower("${var.wq_function_app_name}-${var.environment}")
#   location                                       = var.location
#   resource_group_name                            = var.core_rg_name
#   storage_account_name                           = var.storage_account_name
#   storage_account_access_key                     = var.storage_account_key
#   service_plan_id                                = azurerm_service_plan.function_app_plan.id
#   public_network_access_enabled                  = false
#   ftp_publish_basic_authentication_enabled       = false
#   webdeploy_publish_basic_authentication_enabled = false
#   https_only                                     = true

#   app_settings = {
#     # "KEYVAULT_NAME" = var.keyvault_name
#     # "KEYVAULT_URL"  = var.key_vault_url
#     "WEBSITE_CONTENTOVERVNET" = true
#     "WEBSITE_CONTENTSHARE" = var.wq_file_share_name
#   }
#   site_config {
#     vnet_route_all_enabled = true
#     ftps_state             = "FtpsOnly"
#     application_stack {
#       python_version = "3.11"
#     }
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   lifecycle {
#     ignore_changes = [
#       virtual_network_subnet_id,
#       app_settings
#     ]
#   }
#   tags = {
#     environment  = var.environment
#     "Created By" = var.created_by
#   }
# }




terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core,
        azurerm.connectivity
      ]
    }
  }
}



