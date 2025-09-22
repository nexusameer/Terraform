################################################
##                                            ##
##   Storage account for azsawestagingcore    ##
##                                            ##
################################################

resource "azurerm_storage_account" "azsawestagingcore" {
  provider                      = azurerm.core
  name                          = var.azsawestagingcore
  resource_group_name           = var.core_rg
  location                      = var.core_rg_location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  

  blob_properties {
    # change_feed_enabled = true                         #Change Feed is not supported for the account.
    versioning_enabled = false #`versioning_enabled` can't be true when `is_hns_enabled` is true
    # delete_retention_policy {
    #   days = 30
    # } 
    # restore_policy {
    #   days = 29
    # }
  }
  # lifecycle {
  #   prevent_destroy = true
  # }
  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

# resource "azurerm_management_lock" "azsawestagingcore_lock" {
#   provider           = azurerm.core
#   name               = var.azsawestagingcore_lock_name
#   scope              = azurerm_storage_account.azsawestagingcore.id
#   lock_level         = var.lock_level
#   notes              = "This lock prevents accidental deletion of the Storage Account."
#   depends_on         = [azurerm_storage_account.azsawestagingcore]
# }


resource "azurerm_private_endpoint" "stagestorage_endpoint" {
  provider            = azurerm.core
  name                = var.storageaccount_pe_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawestagingcore.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawestagingcore]
}



resource "azurerm_private_dns_a_record" "stagestorage_dns" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.stagestorage_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.stagestorage_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.stagestorage_endpoint]
}

resource "azurerm_storage_account" "azsawedatalakecore" {
  provider                      = azurerm.core
  name                          = var.datalake_name
  resource_group_name           = var.core_rg
  location                      = var.core_rg_location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"
  blob_properties {
    # change_feed_enabled = true                         #Change Feed is not supported for the account.
    versioning_enabled = false #`versioning_enabled` can't be true when `is_hns_enabled` is true
    # delete_retention_policy {
    #   days = 30
    # } 
    # restore_policy {
    #   days = 29
    # }
  }
  # lifecycle {
  #   prevent_destroy = true
  # }

  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

# resource "azurerm_management_lock" "azsawedatalakecore_lock" {
#   provider           = azurerm.core
#   name               = var.azsawedatalakecore_lock_name
#   scope              = azurerm_storage_account.azsawedatalakecore.id
#   lock_level         = var.lock_level
#   notes              = "This lock prevents accidental deletion of the Storage Account."
#   depends_on         = [azurerm_storage_account.azsawedatalakecore]
# }


resource "azurerm_private_endpoint" "datalake_private_endpoint" {
  provider            = azurerm.core
  name                = var.file_pe_to_datalake_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawedatalakecore.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawedatalakecore]
}

resource "azurerm_private_dns_a_record" "datalake_dns" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.datalake_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.datalake_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.datalake_private_endpoint]
}

resource "azurerm_private_endpoint" "datalake_to_sensor_controlapp_private_endpoint" {
  name                = var.blob_pe_to_datalake_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  subnet_id           = var.core_pe_subnet_id
  provider            = azurerm.core

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.azsawedatalakecore.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.azsawedatalakecore]
}


resource "azurerm_private_dns_a_record" "storage_account_private_dns" {
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.datalake_to_sensor_controlapp_private_endpoint.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.datalake_to_sensor_controlapp_private_endpoint.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.datalake_to_sensor_controlapp_private_endpoint]
  provider            = azurerm.connectivity

}

resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.stagestorage_endpoint, azurerm_private_dns_a_record.stagestorage_dns, azurerm_private_endpoint.datalake_to_sensor_controlapp_private_endpoint, azurerm_private_dns_a_record.storage_account_private_dns]
  create_duration = "60s"
}

resource "azurerm_storage_container" "azsawecorekvap" {
  provider              = azurerm.core
  name                  = var.corekvap
  storage_account_id  = azurerm_storage_account.azsawestagingcore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}
resource "azurerm_storage_container" "azsawecoresensor" {
  provider              = azurerm.core
  name                  = var.coresensor
  storage_account_id  = azurerm_storage_account.azsawestagingcore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "digital_assets_core" {
  provider              = azurerm.core
  name                  = var.digital_assets_core
  storage_account_id  = azurerm_storage_account.azsawestagingcore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}
resource "azurerm_storage_container" "digital_assets_staging" {
  provider              = azurerm.core
  name                  = var.digital_assets_staging
  storage_account_id  = azurerm_storage_account.azsawestagingcore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "datalakebronze" {
  provider              = azurerm.core
  name                  = "bronze"
  storage_account_id  = azurerm_storage_account.azsawedatalakecore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "datalakegold" {
  provider              = azurerm.core
  name                  = "gold"
  storage_account_id  = azurerm_storage_account.azsawedatalakecore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "datalakesilver" {
  provider              = azurerm.core
  name                  = "silver"
  storage_account_id  = azurerm_storage_account.azsawedatalakecore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "digital_assets_datalake" {
  provider              = azurerm.core
  name                  = var.digital_assets_datalake
  storage_account_id  = azurerm_storage_account.azsawedatalakecore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

resource "azurerm_storage_container" "da_staging_datalake" {
  provider              = azurerm.core
  name                  = var.da_staging_datalake
  storage_account_id  = azurerm_storage_account.azsawedatalakecore.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}