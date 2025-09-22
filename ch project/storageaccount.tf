################################################
##                                            ##
##       Nursery Storage Account              ##
##                                            ##
################################################

module "storage_account" {
  source                      = "./modules/storageaccount"
  core_rg                     = module.import_resources.resource_group_name
  ch_rg_name                  = module.import_resources.ch_rg_name
  ch_rg_location              = module.import_resources.ch_rg_location
  location                    = module.import_resources.core_rg_location
  gitlab_resource_group_name  = module.import_resources.dns_rg_name
  blob_private_dns_zone_name  = module.import_resources.blob_private_dns_name
  file_private_dns_zone_name  = module.import_resources.file_private_dns_name
  table_private_dns_zone_name = module.import_resources.table_private_dns_name
  queue_private_dns_zone_name = module.import_resources.queue_private_dns_name
  core_pe_subnet_id           = module.import_resources.core_pe_subnet_id
  ch_pe_subnet_id             = module.import_resources.ch_pe_subnet_id
  inv_pe_subnet_id            = module.import_resources.core_inv_pe_subnet_id
  lss_pe_subnet_id            = module.import_resources.core_lss_pe_subnet_id
  ml_pe_subnet_id             = module.import_resources.core_ml_pe_subnet_id
  lss_hist_function_app_name  = var.lss_hist_function_app_name
  ml_hist_function_app_name   = var.ml_hist_function_app_name
  lss_function_app_name       = var.lss_function_app_name
  crs_function_app_name       = var.crs_function_app_name
  wq_function_app_name        = var.wq_function_app_name
  ml_function_app_name        = var.ml_function_app_name
  inv_lss_function_app_name   = var.inv_lss_function_app_name
  inv_ml_function_app_name    = var.inv_ml_function_app_name
  inv_wq_function_app_name    = var.inv_wq_function_app_name
  inv_storage_name            = "${lower(var.inv_storage_name)}${lower(var.environment)}"
  lss_hist_storage_name       = "${lower(var.lss_hist_storage_name)}${lower(var.environment)}"
  ml_hist_storage_name        = "${lower(var.ml_hist_storage_name)}${lower(var.environment)}"
  inv_pe_name_file            = var.inv_pe_name_file
  inv_pe_name_blob            = var.inv_pe_name_blob
  inv_pe_name_queue           = var.inv_pe_name_queue
  inv_pe_name_table           = var.inv_pe_name_table
  ml_hist_pe_name_file        = var.ml_hist_pe_name_file
  ml_hist_pe_name_blob        = var.ml_hist_pe_name_blob
  ml_hist_pe_name_queue       = var.ml_hist_pe_name_queue
  ml_hist_pe_name_table       = var.ml_hist_pe_name_table
  lss_hist_pe_name_file       = var.lss_hist_pe_name_file
  lss_hist_pe_name_blob       = var.lss_hist_pe_name_blob
  lss_hist_pe_name_queue      = var.lss_hist_pe_name_queue
  lss_hist_pe_name_table      = var.lss_hist_pe_name_table
  sanursery                   = "${lower(var.sanursery)}${lower(var.environment)}"
  fapp_storage_acc_name       = "${lower(var.fapp_storage_acc_name)}${lower(var.environment)}"
  blob_pe_to_fap_name         = "${var.blob_pe_to_fap_name}_${var.environment}-${var.blob_pe_placeholder}"
  file_pe_to_fap_name         = "${var.file_pe_to_fap_name}_${var.environment}-${var.file_pe_placeholder}"
  table_pe_to_fap_name        = "${var.table_pe_to_fap_name}_${var.environment}-${var.table_pe_placeholder}"
  queue_pe_to_fap_name        = "${var.queue_pe_to_fap_name}_${var.environment}-${var.queue_pe_placeholder}"
  sanursery_pe_name_blob      = var.sanursery_pe_name_blob
  sanursery_pe_name_file      = var.sanursery_pe_name_file
  tags                        = var.tags
  environment                 = var.environment
  providers = {
    azurerm.core         = azurerm.core
    azurerm.apps         = azurerm.apps
    azurerm.connectivity = azurerm.connectivity
  }
  depends_on = [module.import_resources]
}
