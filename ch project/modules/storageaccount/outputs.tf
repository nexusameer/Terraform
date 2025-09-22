# output "storage_account_name" {
#   value       = azurerm_storage_account.azsawefapcore.name
# }

# output "storage_account_key" {
#   value = azurerm_storage_account.azsawefapcore.primary_access_key
# }

# output "lss_function_app_file_share_name" {
#   value = azurerm_storage_share.lss_function_app_file_share.name
# }

# output "inv_function_app_file_share_name" {
#   value = azurerm_storage_share.inv_function_app_file_share.name
# }

# output "ml_function_app_name_file_share_name" {
#   value = azurerm_storage_share.ml_function_app_name_file_share.name
# }


output "inv_storage_account_name" {
  value = azurerm_storage_account.inv_storage.name
}

output "inv_storage_account_id" {
  value = azurerm_storage_account.inv_storage.id
}

output "inv_storage_account_key" {
  value = azurerm_storage_account.inv_storage.primary_access_key
}


output "crs_function_app_file_share_name" {
  value = azurerm_storage_share.inv_function_app_file_share_crs.name
}

output "inv_wq_function_app_file_share_name" {
  value = azurerm_storage_share.inv_function_app_file_share_inv_wq.name
}
output "inv_lss_function_app_file_share_name" {
  value = azurerm_storage_share.inv_function_app_file_share_inv_lss.name
}
output "inv_ml_function_app_file_share_name" {
  value = azurerm_storage_share.inv_function_app_file_share_storage_inv_ml.name
}

# output "inv_function_app_file_share_storage_name" {
#   value = azurerm_storage_share.inv_function_app_file_share_storage.name
# }

output "lss_hist_storage_account_name" {
  value = azurerm_storage_account.lss_hist_storage.name
}

output "lss_hist_storage_account_id" {
  value = azurerm_storage_account.lss_hist_storage.id
}

output "lss_hist_storage_account_key" {
  value = azurerm_storage_account.lss_hist_storage.primary_access_key
}


output "lss_hist_function_app_file_share_name" {
  value = azurerm_storage_share.lss_hist_function_app_file_share.name
}

output "lss_function_app_file_share_storage_name" {
  value = azurerm_storage_share.lss_function_app_file_share_storage.name
}

output "ml_hist_storage_account_name" {
  value = azurerm_storage_account.ml_hist_storage.name
}

output "ml_hist_storage_account_id" {
  value = azurerm_storage_account.ml_hist_storage.id
}

output "ml_hist_storage_account_key" {
  value = azurerm_storage_account.ml_hist_storage.primary_access_key
}


output "ml_hist_function_app_file_share_name" {
  value = azurerm_storage_share.ml_hist_function_app_file_share.name
}

output "ml_function_app_file_share_storage_name" {
  value = azurerm_storage_share.ml_function_app_file_share_storage.name
}



output "sanursery_storage_account_name" {
  value = azurerm_storage_account.sanursery.name
}

output "sanursery_storage_account_id" {
  value = azurerm_storage_account.sanursery.id
}