resource "azurerm_service_plan" "az-asp-prem-we-core" {
  provider            = azurerm.core
  name                = var.service_plan_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  os_type             = "Linux"
  sku_name            = "EP1"  # Elastic Premium Plan
  # kind                = "elastic"
  # reserved            = true
  # sku {
  #   tier = "ElasticPremium"
  #   size = "EP1"
  # }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}


resource "azurerm_storage_account" "azsawefapcore" {
  provider                         = azurerm.core
  name                             = lower("${var.fapp_storage_acc_name}")
  resource_group_name              = var.core_rg
  location                         = var.core_rg_location
  account_tier                     = "Standard"
  account_replication_type         = "ZRS"                # Changed from LRS to ZRS
  is_hns_enabled                   = false
  allow_nested_items_to_be_public  = false
  default_to_oauth_authentication  = true
  public_network_access_enabled    = false 
  https_traffic_only_enabled       = true
  large_file_share_enabled         = false
  cross_tenant_replication_enabled = false

  tags = merge(
    var.tags,
    { environment = var.environment
    }
  ) 
  blob_properties {
    change_feed_enabled = true
    versioning_enabled = true
    delete_retention_policy {
      days = 30
    } 
    restore_policy {
      days = 29
    }
  }
  # lifecycle {
  #   prevent_destroy = true
  # }
}

# resource "azurerm_management_lock" "azsawefapcore_lock" {
#   provider           = azurerm.core
#   name               = var.azsawefapcore_lock_name
#   scope              = azurerm_storage_account.azsawefapcore.id
#   lock_level         = var.azsawefapcore_lock_level
#   notes              = "This lock prevents accidental deletion of the Storage Account."
#   depends_on         = [azurerm_storage_account.azsawefapcore]
# }

resource "azurerm_storage_container" "azsawefapcore_container" {
  provider              = azurerm.core
  name                  = var.azsawefapcore_container
  storage_account_id  = azurerm_storage_account.azsawefapcore.id
  container_access_type = "private"
  depends_on            = [azurerm_storage_account.azsawefapcore]
}

resource "azurerm_private_endpoint" "blob_private_endpoint" {
  provider            = azurerm.core
  name                = var.blob_pe_to_fap_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawefapcore]
}

resource "azurerm_private_endpoint" "file_private_endpoint" {
  provider            = azurerm.core
  name                = var.file_pe_to_fap_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawefapcore]
}

resource "azurerm_private_endpoint" "table_private_endpoint" {
  provider            = azurerm.core
  name                = var.table_pe_to_fap_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "tablePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
    subresource_names              = ["table"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawefapcore]
}

resource "azurerm_private_endpoint" "queue_private_endpoint" {
  provider            = azurerm.core
  name                = var.queue_pe_to_fap_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id


  private_service_connection {
    name                           = "queuePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
    subresource_names              = ["queue"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawefapcore]
}

resource "azurerm_private_dns_a_record" "blob_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.blob_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.blob_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.blob_private_endpoint]
}



resource "azurerm_private_dns_a_record" "queue_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".queue.core.windows.net", azurerm_private_endpoint.queue_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.queue_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.queue_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.queue_private_endpoint]
}

resource "azurerm_private_dns_a_record" "file_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.file_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.file_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.file_private_endpoint]
}

resource "azurerm_private_dns_a_record" "table_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".table.core.windows.net", azurerm_private_endpoint.table_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.table_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.table_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.table_private_endpoint]
}



resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_dns_a_record.blob_private_dns, azurerm_private_dns_a_record.file_private_dns, azurerm_private_dns_a_record.queue_private_dns, azurerm_private_dns_a_record.table_private_dns]
  create_duration = "60s"
}

resource "azurerm_storage_share" "st_share" {
  provider             = azurerm.core
  name                 = lower("${var.function_app_name}")
  storage_account_id = azurerm_storage_account.azsawefapcore.id
  quota                = 5120
  depends_on           = [time_sleep.wait_1_min]
}
resource "azurerm_linux_function_app" "az_fap_we_dp_core" {
  provider                                       = azurerm.core
  name                                           = var.function_app_name
  location                                       = var.core_rg_location
  resource_group_name                            = var.core_rg
  service_plan_id                                = azurerm_service_plan.az-asp-prem-we-core.id
  storage_account_name                           = azurerm_storage_account.azsawefapcore.name
  storage_account_access_key                     = azurerm_storage_account.azsawefapcore.primary_access_key
  public_network_access_enabled                  = false
  ftp_publish_basic_authentication_enabled       = false
  webdeploy_publish_basic_authentication_enabled = false
  https_only                                     = true
  # virtual_network_subnet_id                      = var.core_function_app_subnet_id
  app_settings = {
    "KEYVAULT_NAME"           = var.keyvault_name
    "KEYVAULT_URL"            = var.key_vault_url
    "WEBSITE_CONTENTOVERVNET" = true
    "WEBSITE_CONTENTSHARE"    = azurerm_storage_share.st_share.name
  }
  site_config {
    vnet_route_all_enabled = true
    ftps_state             = "FtpsOnly"

    cors {
      allowed_origins = [
        "https://portal.azure.com",
        "https://functions.azure.com",
        "https://functions-staging.azure.com",
        "https://functions-next.azure.com"
      ]
      support_credentials = false
    }
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
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_service_plan.az-asp-prem-we-core,
    azurerm_storage_account.azsawefapcore,
    time_sleep.wait_1_min,
    azurerm_storage_share.st_share

  ]
}

resource "azurerm_app_service_virtual_network_swift_connection" "fapp_vnet" {
  provider       = azurerm.core
  app_service_id = azurerm_linux_function_app.az_fap_we_dp_core.id
  subnet_id      = var.core_function_app_subnet_id
  depends_on     = [azurerm_linux_function_app.az_fap_we_dp_core]
}

resource "azurerm_private_endpoint" "function_app_private_endpoint" {
  provider            = azurerm.core
  name                = var.function_app_pe_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "AZ_PE_WE_CORE_TO_FAP_CORE"
    private_connection_resource_id = azurerm_linux_function_app.az_fap_we_dp_core.id
    subresource_names              = ["sites"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_linux_function_app.az_fap_we_dp_core]
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


# resource "azurerm_storage_account_network_rules" "storage_rules" {
#   provider            = azurerm.core
#   storage_account_id = azurerm_storage_account.azsawefapcore.id
#   default_action = "Deny"
#   # bypass         = ["AzureServices"]
#   # virtual_network_subnet_ids = [var.core_pe_subnet_id]
#   depends_on = [ azurerm_private_dns_a_record.fap_scm_private_dns ]
# }