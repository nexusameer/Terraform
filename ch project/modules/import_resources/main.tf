################################Commented BY FAHAD######################
# data "azurerm_subnet" "core_db_subnet" {
#   provider             = azurerm.core
#   name                 = "${var.core_db_subnet_name}_${var.environment}"
#   virtual_network_name = data.azurerm_virtual_network.core_vnet.name
#   resource_group_name  = data.azurerm_resource_group.core_rg.name
# }

################################################
##                                            ##
##             AKS Private DNS Zone           ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "aks_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.aks_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

################################################
##                                            ##
##             App vnet                       ##
##                                            ##
################################################

# data "azurerm_virtual_network" "az_vnet_we_sensor_dashboard" {
#   name                = "${var.az_vnet_we_sensor_dashboard}_${var.environment}"
#   resource_group_name = data.azurerm_resource_group.az_rg_we_sensor.name
#   provider            = azurerm.apps
# }
################################Commented BY FAHAD######################


# data "azurerm_resource_group" "core_rg" {
#   provider = azurerm.core
#   name     = "${var.core_rg}_${var.environment}"
# }

# data "azurerm_resource_group" "gitlab_rg" {
#   provider = azurerm.core
#   name     = var.gitlab_rg
# }

data "azurerm_subnet" "core_pe_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_pe_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}



data "azurerm_subnet" "ch_db_subnet" {
  provider             = azurerm.apps
  name                 = "${var.ch_db_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.ch_vnet.name
  resource_group_name  = data.azurerm_resource_group.az_rg_we_ch.name
}




data "azurerm_virtual_network" "core_vnet" {
  provider            = azurerm.core
  name                = "${var.core_vnet}_${var.environment}"
  resource_group_name = data.azurerm_resource_group.core_rg.name
}

data "azurerm_virtual_network" "gitlab_vnet" {
  provider            = azurerm.management
  name                = var.gitlab_vnet_name
  resource_group_name = data.azurerm_resource_group.gitlab_rg.name
}

data "azurerm_virtual_network" "ch_vnet" {
  provider            = azurerm.apps
  name                = "${var.az_vnet_we_ch}_${var.environment}"
  resource_group_name = data.azurerm_resource_group.az_rg_we_ch.name
}

data "azurerm_virtual_network" "connectivity_vnet" {
  provider = azurerm.connectivity
  # name                = "${var.az_vnet_we_connectivity}_${var.environment}"
  name                = var.az_vnet_we_connectivity
  resource_group_name = data.azurerm_resource_group.connectivity_rg.name
}

data "azurerm_subnet" "core_eh_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_eh_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_lss_fap_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_lss_fap_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_inv_fap_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_inv_fap_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_inv_pe_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_inv_pe_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_inv_db_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_inv_db_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_ml_fap_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_ml_fap_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_ml_pe_subnet" {
  provider             = azurerm.core
  name                 = "${var.core_ml_pe_subnet_name}_${var.environment}"
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_client_config" "root" {
  provider = azurerm.core
}

data "azurerm_private_dns_zone" "psql_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.psql_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

# data "azuread_service_principal" "postgres_admin" {
#   provider            = azurerm.core
#   display_name = var.admin_principal_name # Replace with your service principal's name
# }



################################################
##                                            ##
##             Container Registry             ##
##                                            ##
################################################

data "azurerm_container_registry" "container_registry_id" {
  provider            = azurerm.core
  name                = var.container_registry_name
  resource_group_name = data.azurerm_resource_group.core_rg.name
}

################################################
##                                            ##
##             App Resource Group             ##
##                                            ##
################################################

data "azurerm_resource_group" "az_rg_we_sensor" {
  name     = "${var.resource_group_name_sensor}_${var.environment}"
  provider = azurerm.apps
}

################################################
##                                            ##
##             CH Resource Group             ##
##                                            ##
################################################

data "azurerm_resource_group" "az_rg_we_ch" {
  name     = "${var.resource_group_name_ch}_${var.environment}"
  provider = azurerm.apps
}

data "azurerm_resource_group" "tre_ch" {
  name     = "${var.resource_group_name_ch}_${var.environment}"
  provider = azurerm.tre
}


################################################
##                                            ##
##             Core Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "core_rg" {
  name     = "${var.resource_group_name_core}_${var.environment}"
  provider = azurerm.core
}

################################################
##                                            ##
##       Connectivity Resource Group          ##
##                                            ##
################################################

data "azurerm_resource_group" "connectivity_rg" {
  # name     = "${var.resource_group_name_connectivity}_${var.environment}"
  name     = var.resource_group_name_connectivity
  provider = azurerm.connectivity
}

################################################
##                                            ##
##             DNS Resource Group             ##
##                                            ##
################################################

data "azurerm_resource_group" "dns_rg" {
  name     = var.dns_rg_name
  provider = azurerm.connectivity
}

################################################
##                                            ##
##             CH Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "ch_rg" {
  name     = "${var.resource_group_name_ch}_${var.environment}"
  provider = azurerm.apps
}

################################################
##                                            ##
##             Key vault                      ##
##                                            ##
################################################

data "azurerm_key_vault" "az-kv-we-core" {
  name                = "${var.az-kv-we-core}-${var.environment}"
  resource_group_name = data.azurerm_resource_group.core_rg.name
  provider            = azurerm.core
}



################################################
##                                            ##
##             App subnet                     ##
##                                            ##
################################################

# data "azurerm_subnet" "az_snet_we_pe_sensor" {
#   name                 = "${var.az_snet_we_pe_sensor}_${var.environment}"
#   resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
#   virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
#   provider             = azurerm.apps
# }

################################################
##                                            ##
##             CH AKS subnet                  ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_aks_ch" {
  name                 = "${var.az_snet_we_aks_ch}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.az_rg_we_ch.name
  virtual_network_name = data.azurerm_virtual_network.ch_vnet.name
  provider             = azurerm.apps
}

################################################
##                                            ##
##             CH PE subnet                   ##
##                                            ##
################################################

data "azurerm_subnet" "pe_subnet_ch" {
  name                 = "${var.pe_subnet_ch_name}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.az_rg_we_ch.name
  virtual_network_name = data.azurerm_virtual_network.ch_vnet.name
  provider             = azurerm.apps
}

################################################
##                                            ##
##             CH AGIC subnet                 ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_agic_ch" {
  name = "${var.az_snet_we_agic_ch}_${var.environment}"
  # name                 = var.az_snet_we_agic_ch
  # name                 = var.az_snet_we_agic_connectivity
  resource_group_name  = data.azurerm_resource_group.az_rg_we_ch.name
  virtual_network_name = data.azurerm_virtual_network.ch_vnet.name
  provider             = azurerm.apps
}

################################################
##                                            ##
##             CH VM subnet                   ##
##                                            ##
################################################

data "azurerm_subnet" "az_snet_we_vm_inv" {
  name                 = "${var.az_snet_we_vm_inv}_${var.environment}"
  resource_group_name  = data.azurerm_resource_group.core_rg.name
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  provider             = azurerm.core
}

################################################
##                                            ##
##          App subnet for webapp             ##
##                                            ##
################################################

# data "azurerm_subnet" "az_snet_we_webapp_sensor" {
#   name                 = "${var.az_snet_we_webapp_sensor}_${var.environment}"
#   resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
#   virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
#   provider             = azurerm.apps
# }

################################################
##                                            ##
##          App subnet for vm sensor          ##
##                                            ##
################################################

# data "azurerm_subnet" "az_snet_we_vm_sensor" {
#   name                 = "${var.az_snet_we_vm_sensor}_${var.environment}"
#   resource_group_name  = data.azurerm_resource_group.az_rg_we_sensor.name
#   virtual_network_name = data.azurerm_virtual_network.az_vnet_we_sensor_dashboard.name
#   provider             = azurerm.apps
# }

################################################
##                                            ##
##          App private dns                   ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "sensor_appservice_private_dns" {
#   name                = var.private_dns_zone_name_webapp
#   resource_group_name = data.azurerm_resource_group.az_rg_we_sensor.name
#   provider            = azurerm.apps
# }

################################################
##                                            ##
##      Private dns for acr app               ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "app_acr_private_dns" {
#   name                = var.acr_private_dns_name
#   resource_group_name = data.azurerm_resource_group.az_rg_we_ch.name
#   provider            = azurerm.apps
# }

################################################
##                                            ##
##      Private dns for core acr              ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "core_acr_private_dns" {
#   name                = var.acr_private_dns_name
#   resource_group_name = data.azurerm_resource_group.core_rg.name
#   provider            = azurerm.core
# }

################################################
##                                            ##
##   Private dns for core to apppservice      ##
##                                            ##
################################################

# data "azurerm_private_dns_zone" "core_appservice_private_dns" {
#   name                = var.private_dns_zone_name_webapp
#   resource_group_name = data.azurerm_resource_group.core_rg.name
#   provider            = azurerm.core
# }

################################################
##                                            ##
##             KCRI Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "kcri_rg" {
  provider = azurerm.tre
  name     = "${var.resource_group_name_kcri}_${var.environment}"
}

################################################
##                                            ##
##                 Action Group               ##
##                                            ##
################################################

data "azurerm_monitor_action_group" "action_group" {
  provider            = azurerm.tre
  name                = var.action_group_name
  resource_group_name = data.azurerm_resource_group.kcri_rg.name
}


################################################
##                                            ##
##           Gitlab Resource Group            ##
##                                            ##
################################################

data "azurerm_resource_group" "gitlab_rg" {
  name     = var.resource_group_name_gitlab
  provider = azurerm.management
}

################################################
##                                            ##
##              Private dns                   ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "appservice_private_dns" {
  name                = var.private_dns_zone_name_webapp
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}

################################################
##                                            ##
##         Private dns for acr                ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "acr_private_dns" {
  name                = var.acr_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}
data "azurerm_container_registry" "acrdpcore" {
  name                = "${var.acrdpcore_name}${var.environment}"
  resource_group_name = data.azurerm_resource_group.core_rg.name
  provider            = azurerm.core
}


################################################
##                                            ##
##         Private dns for blob                ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "blob_private_dns" {
  name                = var.blob_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}

################################################
##                                            ##
##         Private dns for file               ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "file_private_dns" {
  name                = var.file_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}

################################################
##                                            ##
##         Private dns for table              ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "table_private_dns" {
  name                = var.table_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}


################################################
##                                            ##
##         Private dns for queue              ##
##                                            ##
################################################

data "azurerm_private_dns_zone" "queue_private_dns" {
  name                = var.queue_private_dns_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
  provider            = azurerm.connectivity
}

################################################
##                                            ##
##     Function app storage account           ##
##                                            ##
################################################

# data "azurerm_storage_account" "azsawefappcore" {
#   name                = lower("${var.fapp_storage_acc_name}${var.environment}")
#   resource_group_name = data.azurerm_resource_group.core_rg.name
#   provider            = azurerm.core
# }

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core,
        azurerm.apps,
        azurerm.tre,
        azurerm.connectivity,
        azurerm.management
      ]
    }
  }
}

#####################################MANAGED BY ZAMRAN#############################################

data "azurerm_user_assigned_identity" "identity" {
  name                = var.identity_name
  resource_group_name = data.azurerm_resource_group.core_rg.name
  provider            = azurerm.core
}


data "azurerm_private_dns_zone" "batch_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.batch_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}

data "azurerm_resource_group" "gitlab_resource_group" {
  name     = var.gitlab_resource_group_name
  provider = azurerm.management
}

data "azurerm_subnet" "core_lss_batch_subnet" {
  provider             = azurerm.core
  name                 = var.core_lss_batch_subnet_name
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_ml_batch_subnet" {
  provider             = azurerm.core
  name                 = var.core_ml_batch_subnet_name
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}

data "azurerm_subnet" "core_lss_pe_subnet" {
  provider             = azurerm.core
  name                 = var.core_lss_subnet_name
  virtual_network_name = data.azurerm_virtual_network.core_vnet.name
  resource_group_name  = data.azurerm_resource_group.core_rg.name
}


data "azurerm_private_dns_zone" "eh_private_dns_zone" {
  provider            = azurerm.connectivity
  name                = var.eh_private_dns_zone_name
  resource_group_name = data.azurerm_resource_group.dns_rg.name
}
#####################################MANAGED BY ZAMRAN#############################################

################ Log Analytics Workspace #################################

data "azurerm_log_analytics_workspace" "az-law-we-security-logs" {
  provider            = azurerm.management
  name                = var.azurerm_log_analytics_workspace_name
  resource_group_name = var.soc_security_rg_name
}

# ########## AGIC ID #############################
# data "azurerm_application_gateway" "agic_id" {
#   provider            = azurerm.apps
#   # name                = var.appgw_name
#   name                = "${var.appgw_name}_${var.environment}"
#   resource_group_name = data.azurerm_resource_group.az_rg_we_ch.name
# }

data "azurerm_data_factory" "core_adf" {
  name                = var.adf_name
  resource_group_name = data.azurerm_resource_group.core_rg.name
  provider            = azurerm.core
}