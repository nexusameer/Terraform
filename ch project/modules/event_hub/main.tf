# resource "azurerm_eventhub_namespace" "namespace" {
#   name                          = "${var.environment}-${var.namespace_name}"
#   location                      = var.location
#   resource_group_name           = var.resource_group_name
#   sku                           = "Standard"
#   capacity                      = 1
#   public_network_access_enabled = var.public_network_access_enabled
#   network_rulesets {
#     default_action = "Allow"
#     public_network_access_enabled = var.public_network_access_enabled
#     virtual_network_rule {
#         subnet_id               = var.subnet_id
#     }
#   }

#   tags = {
#     environment  = var.environment
#     "Created By" = var.created_by
#   }
# }

# resource "azurerm_eventhub" "eventhub" {
#   name                = "${var.environment}-${var.eventhub_name}"
#   namespace_name      = azurerm_eventhub_namespace.namespace.name
#   resource_group_name = var.resource_group_name
#   partition_count     = var.partition_count
#   message_retention   = var.message_retention
# }

# resource "azurerm_eventhub_consumer_group" "consumer_groups" {
#   for_each            = toset(var.consumer_groups)
#   name                = each.key
#   namespace_name      = azurerm_eventhub_namespace.namespace.name
#   eventhub_name       = azurerm_eventhub.eventhub.name
#   resource_group_name = var.resource_group_name
# }

resource "azurerm_eventhub_namespace" "eventhub_namespace_core" {
  name                          = lower("${var.eventhub_namespace_core}-${var.environment}")
  location                      = var.location
  resource_group_name           = var.core_rg_name
  sku                           = var.sku
  capacity                      = 1
  public_network_access_enabled = var.public_network_access_enabled
  auto_inflate_enabled          = true
  maximum_throughput_units      = 20
  provider                      = azurerm.core
  # network_rulesets {
  #   default_action = "Allow"
  #   public_network_access_enabled = var.public_network_access_enabled
  #   virtual_network_rule {
  #       subnet_id               = var.core_db_subnet_id
  #   }
  # }
  tags = {
    environment  = var.environment
    "Created By" = var.created_by
  }

}


################################################
##                                            ##
##      Private Endpoint For EventHub         ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "core_eventhub_pe" {
  provider            = azurerm.core
  name                = var.eventhub_connection_name
  location            = var.location
  resource_group_name = var.core_rg_name
  subnet_id           = var.pe_eh_subnet_id

  private_service_connection {
    name                           = var.eventhub_connection_name
    private_connection_resource_id = azurerm_eventhub_namespace.eventhub_namespace_core.id
    is_manual_connection           = "false"
    subresource_names              = ["namespace"]
  }
  depends_on = [azurerm_eventhub_namespace.eventhub_namespace_core]
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}


# #resource "azurerm_eventhub" "lss_data_eventbridge_topic" {
# #  name                = var.lss_topic_name
#   namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_core.id
#   partition_count     = 10
#   message_retention   = 7
#   depends_on = [ time_sleep.wait_1_min ]
#   # resource_group_name = var.core_rg_name
#   provider            = azurerm.core
# }

# resource "azurerm_eventhub" "wq_data_eventbridge_topic" {
#   name                = var.wq_topic_name
#   namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_core.id
#   partition_count     = 10
#   message_retention   = 7
#   depends_on = [ time_sleep.wait_1_min ]
#   # resource_group_name = var.core_rg_name
#   provider            = azurerm.core
# }

resource "azurerm_eventhub" "mltopic_data_eventbridge" {
  name              = var.ml_topic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_core.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.core
}

resource "azurerm_eventhub" "sensortopic_eventhub_1" {
  name              = var.sensortopic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_core.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.core
}


resource "azurerm_eventhub_namespace_authorization_rule" "eh_lss_rule" {
  name           = "lss-and-ml-service"
  namespace_name = azurerm_eventhub_namespace.eventhub_namespace_core.name
  #  eventhub_name       = azurerm_eventhub.lss_data_eventbridge_topic.name
  resource_group_name = var.core_rg_name
  listen              = true
  send                = true
  manage              = false
  depends_on          = [azurerm_eventhub.mltopic_data_eventbridge]
  provider            = azurerm.core
}

resource "azurerm_eventhub_namespace_authorization_rule" "eh_wq_rule" {
  name           = "ch-nursery-service"
  namespace_name = azurerm_eventhub_namespace.eventhub_namespace_core.name
  #  eventhub_name       = azurerm_eventhub.wq_data_eventbridge_topic.name
  resource_group_name = var.core_rg_name
  listen              = true
  send                = true
  manage              = false
  depends_on          = [azurerm_eventhub.sensortopic_eventhub_1]
  provider            = azurerm.core
}

# resource "azurerm_eventhub_namespace_authorization_rule" "eh_inv_rule" {
#   name                = "inv"
#   namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_core.name
# #  eventhub_name       = azurerm_eventhub.mltopic_data_eventbridge.name
#   resource_group_name = var.core_rg_name
#   listen              = true
#   send                = true
#   manage              = false
#   depends_on = [ azurerm_eventhub.mltopic_data_eventbridge ]
#   provider            = azurerm.core
# }

resource "azurerm_private_dns_a_record" "eventhub_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".servicebus.windows.net", azurerm_private_endpoint.core_eventhub_pe.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.eh_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.core_eventhub_pe.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.core_eventhub_pe]
}

resource "time_sleep" "wait_1_min" {
  depends_on      = [azurerm_private_endpoint.core_eventhub_pe, azurerm_private_dns_a_record.eventhub_private_dns, azurerm_private_endpoint.ch_eventhub_pe, azurerm_private_dns_a_record.ch_eventhub_private_dns]
  create_duration = "60s"
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_consumer_group" {
  name                = "lss-historical"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_core.name
  eventhub_name       = azurerm_eventhub.sensortopic_eventhub_1.name
  resource_group_name = var.core_rg_name
  provider            = azurerm.core
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_sensortopic_ch_nursery_consumer_group" {
  name                = "ch.nursery"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_core.name
  eventhub_name       = azurerm_eventhub.sensortopic_eventhub_1.name
  resource_group_name = var.core_rg_name
  provider            = azurerm.core
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_usertopic_ch_nursery_consumer_group" {
  name                = "ch.nursery"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
  eventhub_name       = azurerm_eventhub.usertopic_eventhub.name
  resource_group_name = var.ch_rg_name
  provider            = azurerm.apps
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_usertopic_ch_task_consumer_group" {
  name                = "ch.tasks"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
  eventhub_name       = azurerm_eventhub.usertopic_eventhub.name
  resource_group_name = var.ch_rg_name
  provider            = azurerm.apps
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_usertopic_ch_notifications_consumer_group" {
  name                = "ch.notifications"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
  eventhub_name       = azurerm_eventhub.usertopic_eventhub.name
  resource_group_name = var.ch_rg_name
  provider            = azurerm.apps
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_locationtopic_ch_tasks_consumer_group" {
  name                = "ch.tasks"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
  eventhub_name       = azurerm_eventhub.locationtopic_eventhub.name
  resource_group_name = var.ch_rg_name
  provider            = azurerm.apps
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_mltopic_ch_nursery_consumer_group" {
  name                = "ch.nursery"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_core.name
  eventhub_name       = azurerm_eventhub.mltopic_data_eventbridge.name
  resource_group_name = var.core_rg_name
  provider            = azurerm.core
}

resource "azurerm_eventhub_consumer_group" "core_eventhub_mlhistorical_ch_nursery_consumer_group" {
  name                = "ml.historical"
  namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_core.name
  eventhub_name       = azurerm_eventhub.mltopic_data_eventbridge.name
  resource_group_name = var.core_rg_name
  provider            = azurerm.core
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


resource "azurerm_eventhub_namespace" "eventhub_namespace_ch" {
  name                          = lower("${var.eventhub_namespace_ch}-${var.environment}")
  location                      = var.location
  resource_group_name           = var.ch_rg_name
  sku                           = var.sku
  capacity                      = 1
  public_network_access_enabled = var.public_network_access_enabled
  auto_inflate_enabled          = true
  maximum_throughput_units      = 20
  provider                      = azurerm.apps
  # network_rulesets {
  #   default_action = "Allow"
  #   public_network_access_enabled = var.public_network_access_enabled
  #   virtual_network_rule {
  #       subnet_id               = var.core_db_subnet_id
  #   }
  # }
  tags = {
    environment  = var.environment
    "Created By" = var.created_by
  }

}


################################################
##                                            ##
##      Private Endpoint For EventHub CH      ##
##                                            ##
################################################

resource "azurerm_private_endpoint" "ch_eventhub_pe" {
  provider            = azurerm.apps
  name                = var.ch_eventhub_connection_name
  location            = var.location
  resource_group_name = var.ch_rg_name
  subnet_id           = var.pe_ch_subnet_id

  private_service_connection {
    name                           = var.ch_eventhub_connection_name
    private_connection_resource_id = azurerm_eventhub_namespace.eventhub_namespace_ch.id
    is_manual_connection           = "false"
    subresource_names              = ["namespace"]
  }
  depends_on = [azurerm_eventhub_namespace.eventhub_namespace_ch]
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}



resource "azurerm_eventhub" "waterchemistrytopic_eventhub" {
  name              = var.waterchemistrytopic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_ch.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.apps
}
resource "azurerm_eventhub" "usertopic_eventhub" {
  name              = var.userstopic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_ch.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.apps
}
resource "azurerm_eventhub" "nurserytopic_eventhub" {
  name              = var.nurserytopic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_ch.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.apps
}

resource "azurerm_eventhub" "locationtopic_eventhub" {
  name              = var.locationtopic_name
  namespace_id      = azurerm_eventhub_namespace.eventhub_namespace_ch.id
  partition_count   = 10
  message_retention = 7
  depends_on        = [time_sleep.wait_1_min]
  # resource_group_name = var.core_rg_name
  provider = azurerm.apps
}


resource "azurerm_eventhub_namespace_authorization_rule" "user_rule" {
  name           = "ch-application-services"
  namespace_name = azurerm_eventhub_namespace.eventhub_namespace_ch.name
  # eventhub_name       = azurerm_eventhub.user_eventhub.name
  resource_group_name = var.ch_rg_name
  listen              = true
  send                = true
  manage              = false
  depends_on          = [azurerm_eventhub.usertopic_eventhub]
  provider            = azurerm.apps
}

# resource "azurerm_eventhub_namespace_authorization_rule" "tasks_rule" {
#   name                = "task"
#   namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
#   # eventhub_name       = azurerm_eventhub.task_eventhub.name
#   resource_group_name = var.ch_rg_name
#   listen              = true
#   send                = true
#   manage              = false
#   depends_on = [ azurerm_eventhub.usertopic_eventhub ]
#   provider            = azurerm.apps
# }

# resource "azurerm_eventhub_namespace_authorization_rule" "nursery_rule" {
#   name                = "nursery"
#   namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
#   # eventhub_name       = azurerm_eventhub.nursery_eventhub.name
#   resource_group_name = var.ch_rg_name
#   listen              = true
#   send                = true
#   manage              = false
#   depends_on = [ azurerm_eventhub.usertopic_eventhub ]
#   provider            = azurerm.apps
# }

# resource "azurerm_eventhub_authorization_rule" "idb_media_rule" {
#   name                = "idb"
#   namespace_name      = azurerm_eventhub_namespace.eventhub_namespace_ch.name
#   eventhub_name       = azurerm_eventhub.idb_data_eventbridge_topic.name
#   resource_group_name = var.ch_rg_name
#   listen              = true
#   send                = true
#   manage              = false
#   depends_on = [ azurerm_eventhub.idb_data_eventbridge_topic ]
#   provider            = azurerm.apps
# }

resource "azurerm_private_dns_a_record" "ch_eventhub_private_dns" {
  provider            = azurerm.connectivity
  name                = split(".servicebus.windows.net", azurerm_private_endpoint.ch_eventhub_pe.custom_dns_configs[0].fqdn)[0]
  zone_name           = var.eh_private_dns_zone_name
  resource_group_name = var.gitlab_resource_group_name
  ttl                 = 60
  records             = azurerm_private_endpoint.ch_eventhub_pe.custom_dns_configs[0].ip_addresses
  depends_on          = [azurerm_private_endpoint.ch_eventhub_pe]
}