################################################
##                                            ##
##   Storage account for INV History          ##
##                                            ##
################################################

resource "azurerm_storage_account" "inv_storage" {
  provider                      = azurerm.core
  name                          = var.inv_storage_name
  resource_group_name           = var.core_rg
  location                      = var.location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  # blob_properties {
  #   delete_retention_policy {
  #     days = 7
  #   }
  # }
  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_private_endpoint" "inv_storage_endpoint_file" {
  provider            = azurerm.core
  name                = var.inv_pe_name_file
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.inv_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.inv_storage.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.inv_storage]
}

resource "azurerm_private_endpoint" "inv_storage_endpoint_table" {
  provider            = azurerm.core
  name                = var.inv_pe_name_table
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.inv_pe_subnet_id

  private_service_connection {
    name                           = "tablePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.inv_storage.id
    subresource_names              = ["table"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.inv_storage]
}

resource "azurerm_private_endpoint" "inv_storage_endpoint_queue" {
  provider            = azurerm.core
  name                = var.inv_pe_name_queue
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.inv_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.inv_storage.id
    subresource_names              = ["queue"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.inv_storage]
}

resource "azurerm_private_endpoint" "inv_storage_endpoint_blob" {
  provider            = azurerm.core
  name                = var.inv_pe_name_blob
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.inv_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.inv_storage.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.inv_storage]
}

resource "azurerm_private_dns_a_record" "inv_dns_file" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.inv_storage_endpoint_file.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.inv_storage_endpoint_file.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.inv_storage_endpoint_file]
}

resource "azurerm_private_dns_a_record" "inv_dns_blob" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.inv_storage_endpoint_blob.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.inv_storage_endpoint_blob.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.inv_storage_endpoint_blob]
}

resource "azurerm_private_dns_a_record" "inv_dns_table" {
  provider            = azurerm.connectivity
  name                = split(".table.core.windows.net", azurerm_private_endpoint.inv_storage_endpoint_table.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.table_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.inv_storage_endpoint_table.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.inv_storage_endpoint_table]
}

resource "azurerm_private_dns_a_record" "inv_dns_queue" {
  provider            = azurerm.connectivity
  name                = split(".queue.core.windows.net", azurerm_private_endpoint.inv_storage_endpoint_queue.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.queue_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.inv_storage_endpoint_queue.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.inv_storage_endpoint_queue]
}

resource "azurerm_storage_share" "inv_function_app_file_share_crs" {
  provider           = azurerm.core
  name               = lower("${var.crs_function_app_name}")
  storage_account_id = azurerm_storage_account.inv_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}

resource "azurerm_storage_share" "inv_function_app_file_share_inv_wq" {
  provider           = azurerm.core
  name               = lower("${var.inv_wq_function_app_name}")
  storage_account_id = azurerm_storage_account.inv_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}

resource "azurerm_storage_share" "inv_function_app_file_share_inv_lss" {
  provider           = azurerm.core
  name               = lower("${var.inv_lss_function_app_name}")
  storage_account_id = azurerm_storage_account.inv_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}


resource "azurerm_storage_share" "inv_function_app_file_share_storage_inv_ml" {
  provider           = azurerm.core
  name               = lower("${var.inv_ml_function_app_name}")
  storage_account_id = azurerm_storage_account.inv_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}

################################################
##                                            ##
##   Storage account for LSS History          ##
##                                            ##
################################################

resource "azurerm_storage_account" "lss_hist_storage" {
  provider                      = azurerm.core
  name                          = var.lss_hist_storage_name
  resource_group_name           = var.core_rg
  location                      = var.location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  blob_properties {
    delete_retention_policy {
      days = 30
    }
    ## Restore policy needs to disabled if versioning is not enabled.
    # restore_policy {
    #   days = 30
    # }
    versioning_enabled  = false # Cannot be enabled when is_hns_enabled is true
    change_feed_enabled = false # Not supported for the account
    container_delete_retention_policy {
      days = 30
    }
  }
  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_private_endpoint" "lss_hist_storage_endpoint_file" {
  provider            = azurerm.core
  name                = var.lss_hist_pe_name_file
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.lss_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.lss_hist_storage.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.lss_hist_storage]
}

resource "azurerm_private_endpoint" "lss_hist_storage_endpoint_table" {
  provider            = azurerm.core
  name                = var.lss_hist_pe_name_table
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.lss_pe_subnet_id

  private_service_connection {
    name                           = "tablePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.lss_hist_storage.id
    subresource_names              = ["table"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.lss_hist_storage]
}


resource "azurerm_private_endpoint" "lss_hist_storage_endpoint_queue" {
  provider            = azurerm.core
  name                = var.lss_hist_pe_name_queue
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.lss_pe_subnet_id

  private_service_connection {
    name                           = "queuePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.lss_hist_storage.id
    subresource_names              = ["queue"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.lss_hist_storage]
}

resource "azurerm_private_endpoint" "lss_hist_storage_endpoint_blob" {
  provider            = azurerm.core
  name                = var.lss_hist_pe_name_blob
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.lss_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.lss_hist_storage.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.lss_hist_storage]
}

resource "azurerm_private_dns_a_record" "lss_hist_dns_file" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.lss_hist_storage_endpoint_file.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.lss_hist_storage_endpoint_file.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.lss_hist_storage_endpoint_file]
}

resource "azurerm_private_dns_a_record" "lss_hist_dns_blob" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.lss_hist_storage_endpoint_blob.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.lss_hist_storage_endpoint_blob.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.lss_hist_storage_endpoint_blob]
}

resource "azurerm_private_dns_a_record" "lss_hist_dns_table" {
  provider            = azurerm.connectivity
  name                = split(".table.core.windows.net", azurerm_private_endpoint.lss_hist_storage_endpoint_table.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.table_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.lss_hist_storage_endpoint_table.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.lss_hist_storage_endpoint_table]
}

resource "azurerm_private_dns_a_record" "lss_hist_dns_queue" {
  provider            = azurerm.connectivity
  name                = split(".queue.core.windows.net", azurerm_private_endpoint.lss_hist_storage_endpoint_queue.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.queue_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.lss_hist_storage_endpoint_queue.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.lss_hist_storage_endpoint_queue]
}

resource "azurerm_storage_share" "lss_hist_function_app_file_share" {
  provider           = azurerm.core
  name               = lower("${var.lss_hist_function_app_name}")
  storage_account_id = azurerm_storage_account.lss_hist_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}


resource "azurerm_storage_share" "lss_function_app_file_share_storage" {
  provider           = azurerm.core
  name               = lower("${var.lss_function_app_name}")
  storage_account_id = azurerm_storage_account.lss_hist_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}


################################################
##                                            ##
##   Storage account for ML History           ##
##                                            ##
################################################

resource "azurerm_storage_account" "ml_hist_storage" {
  provider                      = azurerm.core
  name                          = var.ml_hist_storage_name
  resource_group_name           = var.core_rg
  location                      = var.location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  # blob_properties {
  #   delete_retention_policy {
  #     days = 7
  #   }
  # }
  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_private_endpoint" "ml_hist_storage_endpoint_file" {
  provider            = azurerm.core
  name                = var.ml_hist_pe_name_file
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.ml_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.ml_hist_storage.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.ml_hist_storage]
}

resource "azurerm_private_endpoint" "ml_hist_storage_endpoint_blob" {
  provider            = azurerm.core
  name                = var.ml_hist_pe_name_blob
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.ml_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.ml_hist_storage.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.ml_hist_storage]
}

resource "azurerm_private_endpoint" "ml_hist_storage_endpoint_table" {
  provider            = azurerm.core
  name                = var.ml_hist_pe_name_table
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.ml_pe_subnet_id

  private_service_connection {
    name                           = "tablePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.ml_hist_storage.id
    subresource_names              = ["table"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.ml_hist_storage]
}

resource "azurerm_private_endpoint" "ml_hist_storage_endpoint_queue" {
  provider            = azurerm.core
  name                = var.ml_hist_pe_name_queue
  location            = var.location
  resource_group_name = var.core_rg
  subnet_id           = var.ml_pe_subnet_id

  private_service_connection {
    name                           = "queuePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.ml_hist_storage.id
    subresource_names              = ["queue"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.ml_hist_storage]
}

resource "azurerm_private_dns_a_record" "ml_hist_dns_file" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.ml_hist_storage_endpoint_file.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.ml_hist_storage_endpoint_file.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.ml_hist_storage_endpoint_file]
}

resource "azurerm_private_dns_a_record" "ml_hist_dns_blob" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.ml_hist_storage_endpoint_blob.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.ml_hist_storage_endpoint_blob.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.ml_hist_storage_endpoint_blob]
}

resource "azurerm_private_dns_a_record" "ml_hist_dns_table" {
  provider            = azurerm.connectivity
  name                = split(".table.core.windows.net", azurerm_private_endpoint.ml_hist_storage_endpoint_table.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.table_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.ml_hist_storage_endpoint_table.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.ml_hist_storage_endpoint_table]
}

resource "azurerm_private_dns_a_record" "ml_hist_dns_queue" {
  provider            = azurerm.connectivity
  name                = split(".queue.core.windows.net", azurerm_private_endpoint.ml_hist_storage_endpoint_queue.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.queue_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.ml_hist_storage_endpoint_queue.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.ml_hist_storage_endpoint_queue]
}

resource "azurerm_storage_share" "ml_hist_function_app_file_share" {
  provider           = azurerm.core
  name               = lower("${var.ml_hist_function_app_name}")
  storage_account_id = azurerm_storage_account.ml_hist_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}

resource "azurerm_storage_share" "ml_function_app_file_share_storage" {
  provider           = azurerm.core
  name               = lower("${var.ml_function_app_name}")
  storage_account_id = azurerm_storage_account.ml_hist_storage.id
  quota              = 5120
  depends_on         = [time_sleep.wait_1_min]
}
################################################
##                                            ##
##   Storage account for azsawestagingcore    ##
##                                            ##
################################################

resource "azurerm_storage_account" "sanursery" {
  provider                      = azurerm.apps
  name                          = var.sanursery
  resource_group_name           = var.ch_rg_name
  location                      = var.ch_rg_location
  public_network_access_enabled = "false"
  account_tier                  = "Standard"
  account_replication_type      = "LRS"

  # blob_properties {
  #   delete_retention_policy {
  #     days = 7
  #   }
  # }
  is_hns_enabled  = true
  min_tls_version = "TLS1_2"
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}

resource "azurerm_private_endpoint" "sanursery_endpoint_file" {
  provider            = azurerm.apps
  name                = var.sanursery_pe_name_file
  location            = var.ch_rg_location
  resource_group_name = var.ch_rg_name
  subnet_id           = var.ch_pe_subnet_id

  private_service_connection {
    name                           = "filePrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.sanursery.id
    subresource_names              = ["file"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.sanursery]
}

resource "azurerm_private_endpoint" "sanursery_endpoint_blob" {
  provider            = azurerm.apps
  name                = var.sanursery_pe_name_blob
  location            = var.ch_rg_location
  resource_group_name = var.ch_rg_name
  subnet_id           = var.ch_pe_subnet_id

  private_service_connection {
    name                           = "blobPrivateLinkConnection"
    private_connection_resource_id = azurerm_storage_account.sanursery.id
    subresource_names              = ["blob"]
    is_manual_connection           = false
  }
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
  depends_on = [azurerm_storage_account.sanursery]
}



resource "azurerm_private_dns_a_record" "sanursery_dns_blob" {
  provider            = azurerm.connectivity
  name                = split(".blob.core.windows.net", azurerm_private_endpoint.sanursery_endpoint_blob.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.blob_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.sanursery_endpoint_blob.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.sanursery_endpoint_blob]
}

resource "azurerm_private_dns_a_record" "sanursery_dns_file" {
  provider            = azurerm.connectivity
  name                = split(".file.core.windows.net", azurerm_private_endpoint.sanursery_endpoint_file.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.file_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.sanursery_endpoint_file.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.sanursery_endpoint_file]
}




# resource "azurerm_storage_account" "azsawefapcore" {
#   provider                         = azurerm.core
#   name                             = lower("${var.fapp_storage_acc_name}")
#   resource_group_name              = var.core_rg
#   location                         = var.location
#   account_tier                     = "Standard"
#   account_replication_type         = "LRS"
#   is_hns_enabled                   = false
#   allow_nested_items_to_be_public  = false
#   default_to_oauth_authentication  = true
#   public_network_access_enabled    = false
#   https_traffic_only_enabled       = true
#   large_file_share_enabled         = false
#   cross_tenant_replication_enabled = false
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
# }

# resource "azurerm_private_endpoint" "blob_private_endpoint" {
#   provider            = azurerm.core
#   name                = var.blob_pe_to_fap_name
#   location            = var.location
#   resource_group_name = var.core_rg
#   subnet_id           = var.core_pe_subnet_id

#   private_service_connection {
#     name                           = "blobPrivateLinkConnection"
#     private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
#     subresource_names              = ["blob"]
#     is_manual_connection           = false
#   }
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
#   depends_on = [ azurerm_storage_account.azsawefapcore ]
# }

# resource "azurerm_private_endpoint" "file_private_endpoint" {
#   provider            = azurerm.core
#   name                = var.file_pe_to_fap_name
#   location            = var.location
#   resource_group_name = var.core_rg
#   subnet_id           = var.core_pe_subnet_id

#   private_service_connection {
#     name                           = "filePrivateLinkConnection"
#     private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
#     subresource_names              = ["file"]
#     is_manual_connection           = false
#   }
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
#   depends_on = [ azurerm_storage_account.azsawefapcore ]
# }

# resource "azurerm_private_endpoint" "table_private_endpoint" {
#   provider            = azurerm.core
#   name                = var.table_pe_to_fap_name
#   location            = var.location
#   resource_group_name = var.core_rg
#   subnet_id           = var.core_pe_subnet_id

#   private_service_connection {
#     name                           = "tablePrivateLinkConnection"
#     private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
#     subresource_names              = ["table"]
#     is_manual_connection           = false
#   }
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
#   depends_on = [ azurerm_storage_account.azsawefapcore ]
# }

# resource "azurerm_private_endpoint" "queue_private_endpoint" {
#   provider            = azurerm.core
#   name                = var.queue_pe_to_fap_name
#   location            = var.location
#   resource_group_name = var.core_rg
#   subnet_id           = var.core_pe_subnet_id


#   private_service_connection {
#     name                           = "queuePrivateLinkConnection"
#     private_connection_resource_id = azurerm_storage_account.azsawefapcore.id
#     subresource_names              = ["queue"]
#     is_manual_connection           = false
#   }
#   tags = merge(
#     var.tags,
#     { environment = var.environment
#     }
#   )
#   depends_on = [ azurerm_storage_account.azsawefapcore ]
# }

# resource "azurerm_private_dns_a_record" "blob_private_dns" {
#   provider            = azurerm.connectivity
#   name                = split(".blob.core.windows.net", azurerm_private_endpoint.blob_private_endpoint.custom_dns_configs[0].fqdn)[0]
#   zone_name           = var.blob_private_dns_zone_name
#   resource_group_name = var.gitlab_resource_group_name
#   ttl                 = 60
#   records             = azurerm_private_endpoint.blob_private_endpoint.custom_dns_configs[0].ip_addresses
#   depends_on          = [azurerm_private_endpoint.blob_private_endpoint]
# }



# resource "azurerm_private_dns_a_record" "queue_private_dns" {
#   provider            = azurerm.connectivity
#   name                = split(".queue.core.windows.net", azurerm_private_endpoint.queue_private_endpoint.custom_dns_configs[0].fqdn)[0]
#   zone_name           = var.queue_private_dns_zone_name
#   resource_group_name = var.gitlab_resource_group_name
#   ttl                 = 60
#   records             = azurerm_private_endpoint.queue_private_endpoint.custom_dns_configs[0].ip_addresses
#   depends_on          = [azurerm_private_endpoint.queue_private_endpoint]
# }

# resource "azurerm_private_dns_a_record" "file_private_dns" {
#   provider            = azurerm.connectivity
#   name                = split(".file.core.windows.net", azurerm_private_endpoint.file_private_endpoint.custom_dns_configs[0].fqdn)[0]
#   zone_name           = var.file_private_dns_zone_name
#   resource_group_name = var.gitlab_resource_group_name
#   ttl                 = 60
#   records             = azurerm_private_endpoint.file_private_endpoint.custom_dns_configs[0].ip_addresses
#   depends_on          = [azurerm_private_endpoint.file_private_endpoint]
# }

# resource "azurerm_private_dns_a_record" "table_private_dns" {
#   provider            = azurerm.connectivity
#   name                = split(".table.core.windows.net", azurerm_private_endpoint.table_private_endpoint.custom_dns_configs[0].fqdn)[0]
#   zone_name           = var.table_private_dns_zone_name
#   resource_group_name = var.gitlab_resource_group_name
#   ttl                 = 60
#   records             = azurerm_private_endpoint.table_private_endpoint.custom_dns_configs[0].ip_addresses
#   depends_on          = [azurerm_private_endpoint.table_private_endpoint]
# }



resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.ml_hist_storage_endpoint_file, azurerm_private_endpoint.ml_hist_storage_endpoint_blob, azurerm_private_endpoint.lss_hist_storage_endpoint_file, azurerm_private_endpoint.lss_hist_storage_endpoint_blob, azurerm_private_endpoint.inv_storage_endpoint_file, azurerm_private_endpoint.inv_storage_endpoint_blob, azurerm_private_endpoint.sanursery_endpoint_file, azurerm_private_endpoint.sanursery_endpoint_blob, azurerm_private_endpoint.inv_storage_endpoint_queue, azurerm_private_endpoint.inv_storage_endpoint_table, azurerm_private_endpoint.lss_hist_storage_endpoint_queue, azurerm_private_endpoint.lss_hist_storage_endpoint_table, azurerm_private_endpoint.ml_hist_storage_endpoint_queue, azurerm_private_endpoint.ml_hist_storage_endpoint_table, azurerm_private_dns_a_record.sanursery_dns_file, azurerm_private_dns_a_record.sanursery_dns_blob, azurerm_private_dns_a_record.inv_dns_file, azurerm_private_dns_a_record.inv_dns_blob, azurerm_private_dns_a_record.lss_hist_dns_file, azurerm_private_dns_a_record.lss_hist_dns_blob, azurerm_private_dns_a_record.ml_hist_dns_file, azurerm_private_dns_a_record.ml_hist_dns_blob, azurerm_private_dns_a_record.inv_dns_queue, azurerm_private_dns_a_record.inv_dns_table, azurerm_private_dns_a_record.lss_hist_dns_queue, azurerm_private_dns_a_record.lss_hist_dns_table, azurerm_private_dns_a_record.ml_hist_dns_queue, azurerm_private_dns_a_record.ml_hist_dns_table]
  create_duration = "60s"
}

# resource "azurerm_storage_share" "lss_function_app_file_share" {
#   provider             = azurerm.core
#   name                 = lower("${var.lss_function_app_name}")
#   storage_account_id   = azurerm_storage_account.azsawefapcore.id
#   quota                = 5120
#   depends_on = [ time_sleep.wait_1_min ]
# }

# resource "azurerm_storage_share" "inv_function_app_file_share" {
#   provider             = azurerm.core
#   name                 = lower("${var.inv_function_app_name}")
#   storage_account_id   = azurerm_storage_account.azsawefapcore.id
#   quota                = 5120
#   depends_on = [ time_sleep.wait_1_min ]
# }

# resource "azurerm_storage_share" "ml_function_app_name_file_share" {
#   provider             = azurerm.core
#   name                 = lower("${var.wq_function_app_name}")
#   storage_account_id   = azurerm_storage_account.azsawefapcore.id
#   quota                = 5120
#   depends_on = [ time_sleep.wait_1_min ]
# }

resource "azurerm_storage_container" "batch_container" {
  provider              = azurerm.apps
  name                  = "digitalassets"
  storage_account_id    = azurerm_storage_account.sanursery.id
  container_access_type = "private"
  depends_on            = [time_sleep.wait_1_min]
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core,
        azurerm.apps,
        azurerm.connectivity
      ]
    }
  }
}