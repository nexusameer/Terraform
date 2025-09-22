# ################################################
# ##                                            ##
# ##          LSS Batch Account                 ##
# ##                                            ##
# ################################################

module "batch_lss" {
  source                       = "./modules/batch"
  core_rg                      = module.import_resources.core_rg_name
  core_rg_location             = module.import_resources.core_rg_location
  core_pe_subnet_id            = module.import_resources.core_lss_pe_subnet_id
  batch_identity               = module.import_resources.identity_id
  acr_login_server_name        = module.import_resources.acr_login_server_name
  core_batch_account_subnet_id = module.import_resources.core_lss_batch_subnet_id
  batch_private_dns_zone_name  = module.import_resources.batch_private_dns_zone_name
  gitlab_resource_group_name   = module.import_resources.dns_rg_name
  batch_identity_principal_id  = module.import_resources.batch_identity_principal_id
  batch_name                   = "${var.lss_batch_name}${lower(var.environment)}"
  batch_pe_name                = "${var.lss_batch_pe_name}_${lower(var.environment)}"
  node_management              = "${var.lss_node_management}-${var.environment}"
  batch_pool_name              = "${var.lss_batch_pool_name}-${lower(var.environment)}"
  acr_image_name               = var.lss_acr_image_name
  tags                         = var.tags
  environment                  = var.environment
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}





# ################################################
# ##                                            ##
# ##           ML Batch Account                 ##
# ##                                            ##
# ################################################

module "batch_ml" {
  source                       = "./modules/batch"
  core_rg                      = module.import_resources.core_rg_name
  core_rg_location             = module.import_resources.core_rg_location
  core_pe_subnet_id            = module.import_resources.core_ml_pe_subnet_id
  batch_identity               = module.import_resources.identity_id
  acr_login_server_name        = module.import_resources.acr_login_server_name
  core_batch_account_subnet_id = module.import_resources.core_ml_batch_subnet_id
  batch_private_dns_zone_name  = module.import_resources.batch_private_dns_zone_name
  gitlab_resource_group_name   = module.import_resources.dns_rg_name
  batch_identity_principal_id  = module.import_resources.batch_identity_principal_id
  batch_name                   = "${var.ml_batch_name}${lower(var.environment)}"
  batch_pe_name                = "${var.ml_batch_pe_name}_${lower(var.environment)}"
  node_management              = "${var.ml_node_management}-${var.environment}"
  batch_pool_name              = "${var.ml_batch_pool_name}-${lower(var.environment)}"
  acr_image_name               = var.ml_acr_image_name
  tags                         = var.tags
  environment                  = var.environment
  providers = {
    azurerm.core         = azurerm.core
    azurerm.connectivity = azurerm.connectivity
  }
}