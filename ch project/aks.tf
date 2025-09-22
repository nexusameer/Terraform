module "aks" {
  source              = "./modules/aks"
  resource_group_name = module.import_resources.ch_rg_name
  location            = var.location
  cluster_name        = var.aks_cluster_name
  dns_prefix          = var.dns_prefix
  node_count          = var.aks_node_count
  node_size           = var.aks_node_size
  # subnet_id           = var.az_snet_we_aks_ch
  subnet_id                       = module.import_resources.ch_aks_subnet_id
  agic_subnet_id                  = module.import_resources.ch_agic_subnet_id
  private_cluster_enabled         = var.private_cluster_enabled
  private_dns_zone_id             = module.import_resources.aks_dns_zone_id
  environment                     = var.environment
  agic_identity_name              = var.agic_identity_name
  default_node_pool_name          = var.default_node_pool_name
  node_os_disk_size               = var.node_os_disk_size
  agw_id                          = module.agic.agw_id
  aks_sku_tier                    = var.aks_sku_tier
  cost_analysis_enabled           = var.cost_analysis_enabled
  auto_scaling_enabled            = var.auto_scaling_enabled
  kubernetes_version              = var.kubernetes_version
  automatic_upgrade_channel       = var.automatic_upgrade_channel
  availability_zones              = var.availability_zones
  min_count                       = var.min_count
  max_count                       = var.max_count
  drain_timeout_in_minutes        = var.drain_timeout_in_minutes
  max_surge                       = var.max_surge
  node_soak_duration_in_minutes   = var.node_soak_duration_in_minutes
  container_registry_id           = module.container_registry.acr_id
  aks_private_dns_name            = var.aks_private_dns_name
  gitlab_rg_name                  = var.dns_rg_name
  gitlab_vnet_id                  = module.import_resources.gitlab_vnet_id
  keda_enabled                    = var.keda_enabled
  vertical_pod_autoscaler_enabled = var.vertical_pod_autoscaler_enabled
  resource_group_id               = module.import_resources.ch_rg_id
  log_analytics_workspace_id      = module.import_resources.log_analytics_workspace_id
  # action_group_id                 = module.import_resources.action_group_id
  # kubernetes_namespace_name     = "${var.kubernetes_namespace_name}-${var.environment}"
  tags = var.tags
  providers = {
    azurerm.apps         = azurerm.apps
    azurerm.connectivity = azurerm.connectivity
  }
}

module "node_pool" {
  source                = "./modules/node_pool"
  node_pool_name        = var.node_pool_name
  kubernetes_cluster_id = module.aks.id
  vm_size               = var.vm_size
  node_count            = var.node_count
  vnet_subnet_id        = module.import_resources.ch_aks_subnet_id
  auto_scaling_enabled  = var.auto_scaling_enabled
  node_min_count        = var.node_min_count
  node_max_count        = var.node_max_count
  tags                  = var.tags
  providers = {
    azurerm = azurerm.apps
  }
}