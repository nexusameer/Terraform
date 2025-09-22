module "import_resources" {
  source                         = "./modules/import_resources/private_dns/"
  keyvault_private_dns_zone_name = var.keyvault_private_dns_zone_name
  blob_private_dns_zone_name     = var.blob_private_dns_zone_name
  psql_private_dns_zone_name     = var.psql_private_dns_zone_name
  batch_private_dns_zone_name    = var.batch_private_dns_zone_name
  queue_private_dns_zone_name    = var.queue_private_dns_zone_name
  file_private_dns_zone_name     = var.file_private_dns_zone_name
  table_private_dns_zone_name    = var.table_private_dns_zone_name
  acr_private_dns_name           = var.acr_private_dns_name
  fap_private_dns_zone_name      = var.fap_private_dns_zone_name
  gitlab_resource_group_name     = var.gitlab_resource_group_name
  eventhub_private_dns_name      = var.eventhub_private_dns_name
  soc_security_rg_name           = var.soc_security_rg_name
  aks_private_dns_zone_name      = var.aks_private_dns_zone_name
  dns_rg_name                    = var.dns_rg_name
  gitlab_vnet_name               = var.gitlab_vnet_name
  connectivity_rg_name           = var.connectivity_rg_name
  connectivity_vnet_name         = var.connectivity_vnet_name
  firewall_name                  = var.firewall_name
  firewall_policy_name           = var.firewall_policy_name

  providers = {
    azurerm.management   = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }
}


module "core_resource_group" {
  source              = "./modules/core/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.resource_group_location
  environment         = var.environment
  tags                = var.tags
  providers = {
    azurerm.core = azurerm.core
  }
}

module "core_vnet" {
  source              = "./modules/core/vnet"
  vnet_name           = var.vnet_name
  vnet_address_space  = var.vnet_address_space
  location            = module.core_resource_group.resource_group_location
  resource_group_name = module.core_resource_group.resource_group_name
  environment         = var.environment
  tags                = var.tags
  providers = {
    azurerm.core = azurerm.core
  }
}

module "core_subnets" {
  source                                     = "./modules/core/subnet"
  sensor_db_subnet_name                      = var.sensor_db_subnet_name
  sensor_pe_subnet_name                      = var.sensor_pe_subnet_name
  sensor_batch_account_subnet_name           = var.sensor_batch_account_subnet_name
  sensor_functionapp_subnet_name             = var.sensor_functionapp_subnet_name
  sensor_bastion_subnet_name                 = var.sensor_bastion_subnet_name
  resource_group_name                        = module.core_resource_group.resource_group_name
  virtual_network_name                       = module.core_vnet.vnet_name
  environment                                = var.environment
  sensor_db_address_prefix                   = var.sensor_db_address_prefix
  sensor_pe_address_prefix                   = var.sensor_pe_address_prefix
  sensor_batch_account_address_prefix        = var.sensor_batch_account_address_prefix
  sensor_functionapp_address_prefix          = var.sensor_functionapp_address_prefix
  sensor_bastion_address_prefix              = var.sensor_bastion_address_prefix
  pe_d_bricks_metastore_subnet_name          = var.pe_d_bricks_metastore_subnet_name
  d_bricks_container_subnet_name             = var.d_bricks_container_subnet_name
  pe_d_bricks_cp_subnet_name                 = var.pe_d_bricks_cp_subnet_name
  pe_d_bricks_managed_storage_subnet_name    = var.pe_d_bricks_managed_storage_subnet_name
  d_bricks_host_subnet_name                  = var.d_bricks_host_subnet_name
  d_bricks_container_address_prefix          = var.d_bricks_container_address_prefix
  pe_d_bricks_managed_storage_address_prefix = var.pe_d_bricks_managed_storage_address_prefix
  pe_d_bricks_cp_address_prefix              = var.pe_d_bricks_cp_address_prefix
  d_bricks_host_address_prefix               = var.d_bricks_host_address_prefix
  event_hub_pe_subnet_name                   = var.event_hub_pe_subnet_name
  ml_function_app_subnet_name                = var.ml_function_app_subnet_name
  inv_pe_subnet_name                         = var.inv_pe_subnet_name
  lss_batch_account_subnet_name              = var.lss_batch_account_subnet_name
  lss_function_app_subnet_name               = var.lss_function_app_subnet_name
  inv_function_app_subnet_name               = var.inv_function_app_subnet_name
  lss_pe_subnet_name                         = var.lss_pe_subnet_name
  inv_db_subnet_name                         = var.inv_db_subnet_name
  inv_vm_subnet_name                         = var.inv_vm_subnet_name
  ml_batch_account_subnet_name               = var.ml_batch_account_subnet_name
  ml_pe_subnet_name                          = var.ml_pe_subnet_name
  ml_function_app_address_prefix             = var.ml_function_app_address_prefix
  event_hub_address_prefix                   = var.event_hub_address_prefix
  lss_function_app_address_prefix            = var.lss_function_app_address_prefix
  inv_db_address_prefix                      = var.inv_db_address_prefix
  inv_vm_address_prefix                      = var.inv_vm_address_prefix
  lss_pe_address_prefix                      = var.lss_pe_address_prefix
  inv_pe_address_prefix                      = var.inv_pe_address_prefix
  ml_batch_account_address_prefix            = var.ml_batch_account_address_prefix
  ml_pe_subnet_address_prefix                = var.ml_pe_subnet_address_prefix
  lss_batch_account_address_prefix           = var.lss_batch_account_address_prefix
  inv_function_app_address_prefix            = var.inv_function_app_address_prefix

  # database_ch_address_prefix      = var.database_ch_address_prefix
  # db_ch_subnet_name               = var.db_ch_subnet_name
  providers = {
    azurerm.core = azurerm.core
  }
}

module "app_resource_group" {
  source                         = "./modules/app/resource_group"
  sensor_resource_group_name     = var.sensor_resource_group_name
  sensor_resource_group_location = var.sensor_resource_group_location
  environment                    = var.environment
  tags                           = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "app_vnet" {
  source                         = "./modules/app/vnet"
  sensor_vnet_name               = var.sensor_vnet_name
  sensor_vnet_address_space      = var.sensor_vnet_address_space
  sensor_resource_group_name     = module.app_resource_group.app_sensor_resource_group_name
  sensor_resource_group_location = module.app_resource_group.app_sensor_resource_group_location
  environment                    = var.environment
  tags                           = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "app_subnets" {
  source                                 = "./modules/app/subnet"
  sensor_resource_group_name             = module.app_resource_group.app_sensor_resource_group_name
  app_sensor_vnet_name                   = module.app_vnet.app_sensor_vnet_name
  webapp_sensor_subnet_name              = var.webapp_sensor_subnet_name
  webapp_sensor_address_prefix           = var.webapp_sensor_address_prefix
  private_endpoint_sensor_subnet_name    = var.private_endpoint_sensor_subnet_name
  private_endpoint_sensor_address_prefix = var.private_endpoint_sensor_address_prefix
  virtual_machine_sensor_subnet_name     = var.virtual_machine_sensor_subnet_name
  virtual_machine_sensor_address_prefix  = var.virtual_machine_sensor_address_prefix
  environment                            = var.environment
  providers = {
    azurerm.app = azurerm.app
  }
}

# module "app_private_dns" {
#   source                         = "./modules/app/private_dns"
#   app_sensor_resource_group_name = module.app_resource_group.app_sensor_resource_group_name
#   acr_sensor_private_dns_name    = var.acr_sensor_private_dns_name
#   acr_sensor_link_name           = var.acr_sensor_link_name
#   app_sensor_virtual_network_id  = module.app_vnet.app_sensor_vnet_id
#   sensor_appservice_dns_name     = var.sensor_appservice_dns_name
#   sensor_appservice_link_name    = var.sensor_appservice_link_name
#   sensor_link_name               = var.sensor_link_name
#   core_private_dns               = module.import_resources.key_vault_private_dns_zone_name #module.core_private_dns.core_vault_name
#   core_resource_group_name       = module.core_resource_group.resource_group_name
#   # core_batch_private_dns_name    = module.core_private_dns.core_batch_account_name
#   # app_batch_link_name            = var.app_batch_link_name
#   app_sensor_vnet_id        = module.app_vnet.app_sensor_vnet_id
#   core_vnet_id              = module.core_vnet.core_vnet_id
#   sensor_psql_dns_vnet_name = var.sensor_psql_dns_vnet_name
#   core_psql_dns_name        = module.import_resources.psql_private_dns_zone_name #module.core_private_dns.core_psql_dns_name
#   environment               = var.environment
#   tags                      = var.tags
#   providers = {
#     azurerm.app  = azurerm.app
#     azurerm.core = azurerm.core
#   }
# }

# module "core_private_dns" {
#   source                      = "./modules/core/private_dns"
#   core_resource_group_name    = module.core_resource_group.resource_group_name
#   core_vnet_id                = module.core_vnet.core_vnet_id
#   core_batch_private_dns_name = var.core_batch_private_dns_name
#   core_batch_link_name        = var.core_batch_link_name
#   core_acr_private_dns_name   = var.core_acr_private_dns_name
#   core_acr_link_name          = var.core_acr_link_name
#   core_fap_private_dns_name   = var.core_fap_private_dns_name
#   core_network_name           = var.core_network_name
#   core_file_dns_name          = var.core_file_dns_name
#   core_file_link_name         = var.core_file_link_name
#   core_fap_dns_name           = var.core_fap_dns_name
#   core_table_fap_dns_name     = var.core_table_fap_dns_name
#   core_queue_fap_dns_name     = var.core_queue_fap_dns_name
#   core_table_link_name        = var.core_table_link_name
#   core_table_record_name      = var.core_table_record_name
#   core_queue_link_name        = var.core_queue_link_name
#   core_queue_record_name      = var.core_queue_record_name
#   core_blob_link_name         = var.core_blob_link_name
#   core_vault_name             = var.core_vault_name
#   core_link_name              = var.core_link_name
#   core_psql_dns_name          = var.core_psql_dns_name
#   core_psql_dns_vnet_name     = var.core_psql_dns_vnet_name
#   environment                 = var.environment
#   tags                        = var.tags
#   providers = {
#     azurerm.core = azurerm.core
#   }
# }

module "core_sensor_gitlab_kvap_peering" {
  source                           = "./modules/vnet_peering/vnet_peering"
  vnet_peering_sensor_name         = var.vnet_peering_sensor_name
  vnet_peering_core_name           = var.vnet_peering_core_name
  environment                      = var.environment
  sensor_resource_group_name       = module.app_resource_group.app_sensor_resource_group_name
  sensor_vnet_virtual_network_name = module.app_vnet.app_sensor_vnet_name
  remote_vnet_core_id              = module.core_vnet.core_vnet_id
  core_resource_group_name         = module.core_resource_group.resource_group_name
  core_virtual_network_name        = module.core_vnet.vnet_name
  sensor_dashboard_vnet_id         = module.app_vnet.app_sensor_vnet_id
  gitlab_resource_group_name       = var.gitlab_resource_group_name
  vnet_peering_gitlab_name         = var.vnet_peering_gitlab_name
  gitlab_vnet_name                 = module.import_resources.gitlab_vnet_name
  gitlab_vnet_id                   = module.import_resources.gitlab_vnet_id
  vnet_peering_kvap_name           = var.vnet_peering_kvap_name
  kvap_rg_name                     = module.kvap_resource_group.kvap_rg_name
  kvap_vnet_name                   = module.kvap_vnet.kvap_vnet_name
  kvap_vnet_id                     = module.kvap_vnet.kvap_vnet_id
  vnet_peering_ch_name             = var.vnet_peering_ch_name
  vnet_ch_name                     = module.ch_vnet.vnet_ch_name
  resource_group_ch_name           = module.ch_resource_group.resource_group_ch_name
  ch_vnet_id                       = module.ch_vnet.vnet_ch_id
  connectivity_vnet_id             = module.import_resources.connectivity_vnet_id
  connectivity_vnet_name           = module.import_resources.connectivity_vnet_name
  vnet_connectivity_peering_name   = module.import_resources.connectivity_vnet_name
  connectivity_rg_name             = module.import_resources.connectivity_rg_name

  depends_on                       = [module.app_subnets, module.core_subnets, module.kvap_vnet]
  providers = {
    azurerm.core       = azurerm.core
    azurerm.app        = azurerm.app
    azurerm.management = azurerm.management
    azurerm.connectivity = azurerm.connectivity
  }
}

module "core_route_table" {
  source                      = "./modules/core/route_table"
  core_route_table_name       = var.core_route_table_name
  core_route                  = var.core_route
  core_route_address_prefix   = var.core_route_address_prefix
  core_next_hop_type          = var.core_next_hop_type
  core_next_hop_ip_address    = module.import_resources.firewall_private_ip
  resource_group_name         = module.core_resource_group.resource_group_name
  location                    = module.core_resource_group.resource_group_location
  batchaccount_subnet_id      = module.core_subnets.batchaccount_id
  db_subnet_id                = module.core_subnets.sensor_db_subnet_id
  functionapp_subnet_id       = module.core_subnets.functionapp_subnet_id
  private_endpoint_subnet_id  = module.core_subnets.private_endpoint_id
  # bricks_container_subnet_id  = module.core_subnets.d_bricks_container_subnet_id
  # bricks_host_subnet_id       = module.core_subnets.d_bricks_host_subnet_id
  # pe_d_bricks_cp_subnet_id    = module.core_subnets.pe_d_bricks_cp_subnet_id
  # bricks_managed_subnet_id    = module.core_subnets.pe_d_bricks_managed_storage_subnet_id
  ml_batch_account_subnet_id  = module.core_subnets.ml_batch_account_subnet_id
  ml_function_app_subnet_id   = module.core_subnets.ml_function_app_subnet_id
  ml_pe_subnet_id             = module.core_subnets.ml_pe_subnet_id
  lss_batch_account_subnet_id = module.core_subnets.lss_batch_account_subnet_id
  lss_function_app_subnet_id  = module.core_subnets.lss_function_app_subnet_subnet_id
  lss_pe_subnet_id            = module.core_subnets.lss_pe_subnet_subnet_id
  inv_db_subnet_id            = module.core_subnets.inv_db_subnet_id
  inv_vm_subnet_id            = module.core_subnets.inv_vm_subnet_id
  inv_function_app_subnet_id  = module.core_subnets.inv_function_app_subnet_subnet_id
  inv_pe_subnet_id            = module.core_subnets.inv_pe_subnet_subnet_id
  event_hub_pe_subnet_id      = module.core_subnets.event_hub_pe_subnet_subnet_id

  environment = var.environment
  tags        = var.tags
  providers = {
    azurerm.core = azurerm.core
  }
}

module "app_route_table" {
  source                             = "./modules/app/route_table"
  app_route_table_name               = var.app_route_table_name
  app_route                          = var.app_route
  app_route_address_prefix           = var.app_route_address_prefix
  app_next_hop_type                  = var.app_next_hop_type
  app_next_hop_ip_address            = module.import_resources.firewall_private_ip
  app_sensor_resource_group_name     = module.app_resource_group.app_sensor_resource_group_name
  app_sensor_resource_group_location = module.app_resource_group.app_sensor_resource_group_location
  private_endpoint_sensor_subnet_id  = module.app_subnets.private_endpoint_sensor_subnet_id
  webapp_sensor_subnet_id            = module.app_subnets.webapp_sensor_subnet_id
  virtual_machine_sensor_subnet_id   = module.app_subnets.virtual_machine_sensor_subnet_id
  environment                        = var.environment
  tags                               = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "ch_route_table" {
  source                     = "./modules/ch/route_table"
  ch_route_table_name        = var.ch_route_table_name
  ch_route                   = var.ch_route
  ch_route_address_prefix    = var.ch_route_address_prefix
  ch_next_hop_type           = var.ch_next_hop_type
  ch_next_hop_ip_address     = module.import_resources.firewall_private_ip
  ch_resource_group_name     = module.ch_resource_group.resource_group_ch_name
  ch_resource_group_location = module.ch_resource_group.resource_group_ch_location
  ch_aks_subnet_id           = module.ch_subnets.aks_ch_subnet_id
  ch_db_subnet_id            = module.ch_subnets.ch_db_subnet_id
  ch_pe_subnet_id            = module.ch_subnets.ch_pe_subnet_id
  ch_internet_route_table_name = var.ch_internet_route_table_name
  ch_routes                  = var.ch_routes
  ch_appgtw_subnet_id        = module.ch_subnets.appgtw_ch_subnet_id
  environment                = var.environment
  tags                       = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

# module "gitlab_vnet" {
#   source                     = "./modules/gitlab/vnet"
#   gitlab_vnet_name           = var.gitlab_vnet_name
#   gitlab_resource_group_name = var.gitlab_resource_group_name
#   environment                = var.environment
#   providers = {
#     azurerm.management = azurerm.management
#   }
# }

# module "gitlab_private_dns" {
#   source                      = "./modules/gitlab/private_dns"
#   gitlab_acr_link_name        = var.gitlab_acr_link_name
#   core_resource_group_name    = module.core_resource_group.resource_group_name
#   core_acr_private_dns_name   = var.core_acr_private_dns_name
#   gitlab_vnet_id              = module.gitlab_vnet.gitlab_vnet_id
#   gitlab_psql_dns_vnet_name   = var.gitlab_psql_dns_vnet_name
#   core_psql_private_dns_name  = module.core_private_dns.core_psql_dns_name
#   gitlab_batch_link_name      = var.gitlab_batch_link_name
#   core_batch_private_dns_name = module.core_private_dns.core_batch_account_name
#   environment                 = var.environment
#   tags                        = var.tags
#   depends_on                  = [module.core_private_dns]
#   providers = {
#     azurerm.core = azurerm.core
#   }
# }

module "kvap_resource_group" {
  source       = "./modules/kvap/resource_group"
  kvap_rg_name = var.kvap_rg_name
  location     = var.kvap_rg_location
  environment  = var.environment
  tags         = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "kvap_subnet" {
  source       = "./modules/kvap/subnet"
  environment  = var.environment
  location     = var.kvap_rg_location
  kvap_rg_name = module.kvap_resource_group.kvap_rg_name
  # vm_gpu_kvap_subnet_name   = var.vm_gpu_kvap_subnet_name
  # vm_gpu_kvap_subnet_prefix = var.vm_gpu_kvap_subnet_prefix
  # vm_cpu_kvap_subnet_name   = var.vm_cpu_kvap_subnet_name
  # vm_cpu_kvap_subnet_prefix = var.vm_cpu_kvap_subnet_prefix
  kvap_vm_subnet_name    = var.kvap_vm_subnet_name
  kvap_vm_address_prefix = var.kvap_vm_address_prefix
  kvap_vnet_name         = module.kvap_vnet.kvap_vnet_name
  providers = {
    azurerm.app = azurerm.app
  }
}

module "kvap_vnet" {
  source             = "./modules/kvap/vnet"
  location           = var.kvap_rg_location
  kvap_vnet_name     = var.kvap_vnet_name
  kvap_address_space = var.kvap_address_space
  kvap_rg_name       = module.kvap_resource_group.kvap_rg_name
  environment        = var.environment
  tags               = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}


module "kcri_resource_group" {
  source       = "./modules/kcri/resource_group"
  kcri_rg_name = "${var.kcri_resource_group_name}_${var.environment}"
  location     = var.resource_group_location
  environment  = var.environment
  tags         = var.tags

  providers = {
    azurerm.kcri = azurerm.kcri
  }
}

module "ch_kcri_resource_group" {
  source       = "./modules/kcri/resource_group"
  kcri_rg_name = "${var.resource_group_ch_name}_${var.environment}"
  location     = var.resource_group_location
  environment  = var.environment
  tags         = var.tags

  providers = {
    azurerm.kcri = azurerm.kcri
  }
}


module "action_group" {
  source              = "./modules/kcri/action_group"
  recipient           = var.recipient
  resource_group_name = module.kcri_resource_group.kcri_resource_group_name
  environment         = var.environment
  tags                = var.tags
  providers = {
    azurerm.kcri = azurerm.kcri
  }
}



module "ch_resource_group" {
  source                 = "./modules/ch/resource_group"
  resource_group_ch_name = var.resource_group_ch_name
  location               = var.resource_group_location
  environment            = var.environment
  tags                   = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "ch_vnet" {
  source                 = "./modules/ch/vnet"
  vnet_ch_name           = var.vnet_ch_name
  vnet_ch_address_space  = var.vnet_ch_address_space
  resource_group_ch_name = module.ch_resource_group.resource_group_ch_name
  location               = module.core_resource_group.resource_group_location
  environment            = var.environment
  tags                   = var.tags
  providers = {
    azurerm.app = azurerm.app
  }
}

module "ch_subnets" {
  source                 = "./modules/ch/subnet"
  resource_group_ch_name = module.ch_resource_group.resource_group_ch_name
  vnet_ch_name           = module.ch_vnet.vnet_ch_name
  # machine_learning_ch_subnet_name    = var.machine_learning_ch_subnet_name
  # machine_learning_ch_address_prefix = var.machine_learning_ch_address_prefix
  # function_app_ch_subnet_name        = var.function_app_ch_subnet_name
  # function_app_ch_address_prefix     = var.function_app_ch_address_prefix
  # virtual_machine_ch_subnet_name     = var.virtual_machine_ch_subnet_name
  # virtual_machine_ch_address_prefix  = var.virtual_machine_ch_address_prefix
  aks_ch_subnet_name              = var.aks_ch_subnet_name
  aks_ch_address_prefix           = var.aks_ch_address_prefix
  private_endpoint_ch_subnet_name = var.private_endpoint_ch_subnet_name
  ch_db_subnet_name               = var.ch_db_subnet_name
  ch_pe_subnet_name               = var.ch_pe_subnet_name
  ch_appgtw_subnet_name           = var.ch_appgtw_subnet_name
  ch_db_address_prefix            = var.ch_db_address_prefix
  ch_pe_address_prefix            = var.ch_pe_address_prefix
  ch_appgtw_address_prefix        = var.ch_appgtw_address_prefix
  environment                     = var.environment
  providers = {
    azurerm.app = azurerm.app
  }
}

# module "core_private_dns_link" {
#   source                         = "./modules/core/private_dns_link"
#   core_vnet_id                   = module.core_vnet.core_vnet_id
#   file_private_dns_zone_name     = module.import_resources.function_app_file_private_dns_zone_name
#   blob_private_dns_zone_name     = module.import_resources.function_app_blob_private_dns_zone_name
#   queue_private_dns_zone_name    = module.import_resources.function_app_queue_private_dns_zone_name
#   batch_private_dns_zone_name    = module.import_resources.batch_private_dns_zone_name
#   gitlab_rg                      = module.import_resources.gitlab_resource_group_name
#   keyvault_private_dns_zone_name = module.import_resources.key_vault_private_dns_zone_name
#   table_private_dns_zone_name    = module.import_resources.function_app_table_private_dns_zone_name
#   core_link_name                 = var.core_link_name
#   fap_private_dns_zone_name      = module.import_resources.function_app_private_dns_zone_name
#   psql_private_dns_zone_name     = module.import_resources.psql_private_dns_zone_name
#   acr_private_dns_name           = module.import_resources.acr_private_dns_zone_name
#   providers = {
#     azurerm.management = azurerm.management
#   }

# }


module "private_dns_vnet_link" {
  source                         = "./modules/private_dns_vnet_links"
  environment                    = var.environment
  app_sensor_vnet_id             = module.app_vnet.app_sensor_vnet_id
  gitlab_resource_group_name     = module.import_resources.dns_rg_name
  keyvault_private_dns_zone_name = module.import_resources.key_vault_private_dns_zone_name
  sensor_link_name               = lower("${var.sensor_link_name}_${var.environment}")
  fap_private_dns_zone_name      = module.import_resources.function_app_private_dns_zone_name
  psql_private_dns_zone_name     = module.import_resources.psql_private_dns_zone_name
  acr_private_dns_name           = module.import_resources.acr_private_dns_zone_name
  core_vnet_id                   = module.core_vnet.core_vnet_id
  file_private_dns_zone_name     = module.import_resources.function_app_file_private_dns_zone_name
  blob_private_dns_zone_name     = module.import_resources.function_app_blob_private_dns_zone_name
  queue_private_dns_zone_name    = module.import_resources.function_app_queue_private_dns_zone_name
  batch_private_dns_zone_name    = module.import_resources.batch_private_dns_zone_name
  table_private_dns_zone_name    = module.import_resources.function_app_table_private_dns_zone_name
  core_link_name                 = lower("${var.core_link_name}_${var.environment}")
  sensor_blob_link_name          = lower("${var.sensor_blob_link_name}_${var.environment}")
  eventhub_private_dns_zone_name = module.import_resources.eventhub_private_dns_zone_name
  eventhub_link_name             = lower("${var.eventhub_link_name}_${var.environment}")
  ch_link_name                   = lower("${var.ch_link_name}_${var.environment}")
  ch_vnet_id                     = module.ch_vnet.vnet_ch_id
  psql_link_name                 = lower("${var.psql_link_name}_${var.environment}")
  acr_link_name                  = lower("${var.acr_link_name}_${var.environment}")
  blob_link_name                 = lower("${var.blob_link_name}_${var.environment}")
  aks_private_dns_zone_name      = module.import_resources.aks_private_dns_zone_name
  aks_link_name_ch               = lower("${var.aks_link_name_ch}_${var.environment}")
  aks_link_name_core             = lower("${var.aks_link_name_core}_${var.environment}")
  providers = {
    azurerm.connectivity = azurerm.connectivity
  }

}


module "backup_vault" {
  source               = "./modules/connectivity/backup_vaults"
  backup_vault_name    = "${var.backup_vault_name}${var.environment}"
  soc_security_rg_name = module.import_resources.soc_security_resource_group_name
  security_rg_location = module.import_resources.soc_security_resource_group_location
  tags                 = var.tags
  environment          = var.environment
  providers = {
    azurerm.management = azurerm.management
  }

}


# ###############################################
# #                                            ##
# #              Security RG                   ##
# #                                            ##
# ###############################################
# module "security_resource_group" {
#   source               = "./modules/connectivity/resource_group"
#   soc_security_rg_name = "${var.soc_security_rg_name}-${var.environment}"
#   security_rg_location = var.security_rg_location
#   environment          = var.environment
#   tags                 = var.tags
#   providers = {
#     azurerm.management = azurerm.management
#   }
# }


# ###############################################
# #                                            ##
# #              Log analytics                 ##
# #                                            ##
# ###############################################

# module "loganalytics" {
#   source                  = "./modules/connectivity/loganalytics"
#   az_law_we_security_logs = var.az_law_we_security_logs
#   environment             = var.environment
#   tags                    = var.tags
#   soc_security_rg_name    = module.security_resource_group.soc_security_rg_name
#   security_rg_location    = module.security_resource_group.soc_security_rg_location
#   depends_on              = [module.security_resource_group]
#   providers = {
#     azurerm.management = azurerm.management
#   }
# }


# ################################################
# ##                                            ##
# ##                Sentinal                    ##
# ##                                            ##
# ################################################
# module "sentinal" {
#   source               = "./modules/connectivity/sentinal"
#   log_workspace_id     = module.loganalytics.log_security_analytics_id
#   log_workspace_name   = module.loganalytics.log_security_analytics_name
#   soc_security_rg_name = module.security_resource_group.soc_security_rg_name
#   security_rg_location = module.security_resource_group.soc_security_rg_location
#   log_sources          = ["azure_keyvault", "azure_activity", "azure_nsg"]
#   # depends_on = [ module.loganalytics ]
#   providers = {
#     azurerm.management = azurerm.management
#   }
# }


################################################
##                                            ##
##                Defender                    ##
##                                            ##
################################################



module "defender" {
  source = "./modules/connectivity/defender_cloud"

  core_security_center_resource_types = [
    "AppServices",
    "OpenSourceRelationalDatabases",
    "StorageAccounts",
    "Containers",
    "KeyVaults"
  ]
  app_security_center_resource_types = [
    "AppServices",
    "StorageAccounts",
    "ContainerRegistry",
    "VirtualMachines"
  ]
  kcri_security_center_resource_types = [
    # "AppServices",
    # "StorageAccounts",
    # "ContainerRegistry",
    # "VirtualMachines"
  ]
  providers = {
    azurerm.core = azurerm.core
    azurerm.app  = azurerm.app
    azurerm.kcri = azurerm.kcri
  }

}


module "fw_rules" {
  source             = "./modules/fw_rules"
  fw_policy_id = module.import_resources.azure_firewall_policy_id
  core_vnet_address_space = module.core_vnet.vnet_address_space
  ch_vnet_address_space = module.ch_vnet.vnet_ch_address_space
  core_to_ch_rule_name = "${var.environment}-${var.core_to_ch_rule_name}"
  fw_policy_rule_cg_name = "${var.environment}-${var.fw_policy_rule_cg_name}"
  ch_to_core_rule_name = "${var.environment}-${var.ch_to_core_rule_name}"
  core_to_kvap_rule_name = "${var.environment}-${var.core_to_kvap_rule_name}"
  kvap_vnet_address_space = module.kvap_vnet.kvap_vnet_address_space
  network_collection_rule_name = "${var.environment}-${var.network_collection_rule_name}"
  management_collection_rule_name = "${var.environment}-${var.management_collection_rule_name}"
  kvap_to_core_rule_name = "${var.environment}-${var.kvap_to_core_rule_name}"
  sensor_vnet_address_space = module.app_vnet.app_sensor_vnet_address_space
  core_to_sensor_rule_name = "${var.environment}-${var.core_to_sensor_rule_name}"
  sensor_to_core_rule_name = "${var.environment}-${var.sensor_to_core_rule_name}"
  gitlab_vnet_address_space        = module.import_resources.gitlab_vnet_address_space
  gitlab_to_core_rule_name = "${var.environment}-${var.gitlab_to_core_rule_name}"
  core_to_gitlab_rule_name = "${var.environment}-${var.core_to_gitlab_rule_name}"
  gitlab_to_sensor_rule_name = "${var.environment}-${var.gitlab_to_sensor_rule_name}"
  sensor_to_gitlab_rule_name = "${var.environment}-${var.sensor_to_gitlab_rule_name}"
  gitlab_to_ch_rule_name = "${var.environment}-${var.gitlab_to_ch_rule_name}"
  ch_to_gitlab_rule_name = "${var.environment}-${var.ch_to_gitlab_rule_name}"
  gitlab_to_kvap_rule_name = "${var.environment}-${var.gitlab_to_kvap_rule_name}"
  kvap_to_gitlab_rule_name = "${var.environment}-${var.kvap_to_gitlab_rule_name}"
  vpop_collection_rule_name = "${var.environment}-${var.vpop_collection_rule_name}"
  core_to_vpop_rule_name    = "${var.environment}-${var.core_to_vpop_rule_name}"
  vpop_address_space        = var.vpop_address_space
  vpop_to_core_rule_name     = "${var.environment}-${var.vpop_to_core_rule_name}"
  ch_to_vpop_rule_name       = "${var.environment}-${var.ch_to_vpop_rule_name}"
  vpop_to_ch_rule_name       = "${var.environment}-${var.vpop_to_ch_rule_name}"
  vpop_to_kvap_rule_name     =  "${var.environment}-${var.vpop_to_kvap_rule_name}"
  kvap_to_vpop_rule_name     = "${var.environment}-${var.kvap_to_vpop_rule_name}"
  sensor_to_vpop_rule_name   = "${var.environment}-${var.sensor_to_vpop_rule_name}"
  vpop_to_sensor_rule_name   = "${var.environment}-${var.vpop_to_sensor_rule_name}"
  gitlab_to_vpop_rule_name   = "${var.environment}-${var.gitlab_to_vpop_rule_name}"
  vpop_to_gitlab_rule_name   = "${var.environment}-${var.vpop_to_gitlab_rule_name}"
  sensor_to_internet_rule_name = "${var.environment}-${var.sensor_to_internet_rule_name}"
  gitlab_to_internet_rule_name = "${var.environment}-${var.gitlab_to_internet_rule_name}"
  sensor_batch_account_subnet_address_prefixes = module.core_subnets.sensor_batch_account_subnet_address_prefixes
  sensor_functionapp_subnet_prefixes = module.core_subnets.sensor_functionapp_subnet_prefixes
  batch_account_sensor_to_internet_rule_name = "${var.environment}-${var.batch_account_sensor_to_internet_rule_name}"
  function_app_sensor_to_internet_rule_name = "${var.environment}-${var.function_app_sensor_to_internet_rule_name}"
  function_app_ml_to_internet_rule_name = "${var.environment}-${var.function_app_ml_to_internet_rule_name}"
  ml_function_app_subnet_address_prefixes = module.core_subnets.ml_function_app_subnet_address_prefixes
  batch_account_ml_to_internet_rule_name = "${var.environment}-${var.batch_account_ml_to_internet_rule_name}"
  ml_batch_account_subnet_address_prefixes = module.core_subnets.ml_batch_account_subnet_address_prefixes
  lss_batch_account_subnet_address_prefixes = module.core_subnets.lss_batch_account_subnet_address_prefixes
  batch_account_lss_to_internet_rule_name = "${var.environment}-${var.batch_account_lss_to_internet_rule_name}"
  lss_function_app_subnet_address_prefixes = module.core_subnets.lss_function_app_subnet_address_prefixes
  function_app_lss_to_internet_rule_name = "${var.environment}-${var.function_app_lss_to_internet_rule_name}"
  inv_function_app_subnet_address_prefixes = module.core_subnets.inv_function_app_subnet_address_prefixes
  function_app_inv_to_internet_rule_name = "${var.environment}-${var.function_app_inv_to_internet_rule_name}"
  
  providers = {
    azurerm.connectivity = azurerm.connectivity
  }
}

# NSG Modules

module "core_nsg"{
  source = "./modules/core/nsg"
  nsg_name = "${var.core_nsg_name}_${var.environment}"
  location = module.core_resource_group.resource_group_location
  core_resource_group_name = module.core_resource_group.resource_group_name
  sensor_bastion_subnet_id = module.core_subnets.sensor_bastion_subnet_id
  lss_function_app_subnet_id = module.core_subnets.lss_function_app_subnet_subnet_id
  lss_batch_account_subnet_id = module.core_subnets.lss_batch_account_subnet_id
  inv_function_app_subnet_id = module.core_subnets.inv_function_app_subnet_subnet_id
  inv_db_subnet_id = module.core_subnets.inv_db_subnet_id
  inv_vm_subnet_id = module.core_subnets.inv_vm_subnet_id
  ml_function_app_subnet_id = module.core_subnets.ml_function_app_subnet_id
  ml_batch_account_subnet_id = module.core_subnets.ml_batch_account_subnet_id
  ml_pe_subnet_id = module.core_subnets.ml_pe_subnet_id
  lss_pe_subnet_id = module.core_subnets.lss_pe_subnet_subnet_id
  inv_pe_subnet_id = module.core_subnets.inv_pe_subnet_subnet_id
  event_hub_pe_subnet_id = module.core_subnets.event_hub_pe_subnet_subnet_id
  sensor_batch_account_subnet_id = module.core_subnets.sensor_batch_account_subnet_id
  sensor_functionapp_subnet_id = module.core_subnets.sensor_functionapp_subnet_id
  sensor_db_subnet_id = module.core_subnets.sensor_db_subnet_id
  sensor_pe_subnet_id = module.core_subnets.sensor_pe_subnet_id
  environment         = var.environment
  tags                = var.tags

  providers = {
    azurerm.core = azurerm.core
  }
}


module "app_nsg"{
  source = "./modules/app/nsg"
  nsg_name = "${var.app_nsg_name}_${var.environment}"
  location = module.app_resource_group.app_sensor_resource_group_location
  app_resource_group_name = module.app_resource_group.app_sensor_resource_group_name
  environment         = var.environment
  tags                = var.tags
  virtual_machine_sensor_subnet_id = module.app_subnets.virtual_machine_sensor_subnet_id
  private_endpoint_sensor_subnet_id = module.app_subnets.private_endpoint_sensor_subnet_id
  webapp_sensor_subnet_id = module.app_subnets.webapp_sensor_subnet_id
  providers = {
    azurerm.app = azurerm.app
  }
}

module "ch_nsg"{
  source = "./modules/ch/nsg"
  nsg_name = "${var.ch_nsg_name}_${var.environment}"
  location = module.ch_resource_group.resource_group_ch_location
  resource_group_ch_name = module.ch_resource_group.resource_group_ch_name
  aks_ch_subnet_id = module.ch_subnets.aks_ch_subnet_id
  ch_db_subnet_id = module.ch_subnets.ch_db_subnet_id
  ch_pe_subnet_id = module.ch_subnets.ch_pe_subnet_id
  ch_appgtw_subnet_id = module.ch_subnets.appgtw_ch_subnet_id
  environment         = var.environment
  tags                = var.tags

  providers = {
    azurerm.app = azurerm.app
  }
}

module "kvap_nsg"{
  source = "./modules/kvap/nsg"
  nsg_name = "${var.kvap_nsg_name}_${var.environment}"
  location = module.kvap_resource_group.kvap_rg_location
  kvap_rg_name = module.kvap_resource_group.kvap_rg_name
  environment         = var.environment
  tags                = var.tags
  kvap_vm_subnet_id = module.kvap_subnet.kvap_vm_subnet_id

  providers = {
    azurerm.app = azurerm.app
  }
}