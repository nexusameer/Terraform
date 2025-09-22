################################################
##                                            ##
##              Container Registry            ##
##                                            ##
################################################

module "container_registry" {
  source                     = "./modules/acr"
  environment                = var.environment
  tags                       = var.tags
  acr_name                   = lower("${var.acr_name}${var.environment}")
  connection_name            = "${var.connection_name}_${var.environment}"
  ch_rg_location             = module.import_resources.ch_rg_location
  ch_rg_name                 = module.import_resources.ch_rg_name
  gitlab_resource_group_name = module.import_resources.dns_rg_name
  ch_pe_subnet_id            = module.import_resources.ch_pe_subnet_id
  acr_private_dns_zone_name  = module.import_resources.acr_private_dns_zone_name
  #   ip_range                   = var.ip_range
  depends_on = [module.import_resources]
  providers = {

    azurerm.connectivity = azurerm.connectivity
    azurerm.apps         = azurerm.apps
  }
}