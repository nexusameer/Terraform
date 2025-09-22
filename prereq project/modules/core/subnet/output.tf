output "sensor_db_subnet_id" {
  value = azurerm_subnet.sensor_db_subnet.id
}

output "sensor_db_subnet" {
  value = azurerm_subnet.sensor_db_subnet.name
}

output "sensor_db_address_prefixes" {
  value = azurerm_subnet.sensor_db_subnet.address_prefixes
}

output "sensor_pe_subnet_name" {
  value = azurerm_subnet.sensor_pe_subnet.name
}

output "sensor_pe_subnet_id" {
  value = azurerm_subnet.sensor_pe_subnet.id
}

output "sensor_pe_subnet_address_prefixes" {
  value = azurerm_subnet.sensor_pe_subnet.address_prefixes
}

output "sensor_batch_account_subnet_name" {
  value = azurerm_subnet.sensor_batch_account_subnet.name
}

output "sensor_batch_account_subnet_id" {
  value = azurerm_subnet.sensor_batch_account_subnet.id
}

output "sensor_batch_account_subnet_address_prefixes" {
  value = azurerm_subnet.sensor_batch_account_subnet.address_prefixes
}

output "sensor_functionapp_subnet_name" {
  value = azurerm_subnet.sensor_functionapp_subnet.name
}
output "sensor_functionapp_subnet_id" {
  value = azurerm_subnet.sensor_functionapp_subnet.id
}

output "sensor_functionapp_subnet_prefixes" {
  value = azurerm_subnet.sensor_functionapp_subnet.address_prefixes
}


output "sensor_bastion_subnet_name" {
  value = azurerm_subnet.sensor_bastion_subnet.name
}

output "sensor_bastion_subnet_id" {
  value = azurerm_subnet.sensor_bastion_subnet.id
}

output "sensor_bastion_address_prefixes" {
  value = azurerm_subnet.sensor_bastion_subnet.address_prefixes
}

# output "d_bricks_container_subnet_name" {
#   value = azurerm_subnet.d_bricks_container_subnet.name
# }

# output "d_bricks_container_subnet_id" {
#   value = azurerm_subnet.d_bricks_container_subnet.id
# }

# output "d_bricks_container_subnet_address_prefixes" {
#   value = azurerm_subnet.d_bricks_container_subnet.address_prefixes
# }

# output "d_bricks_host_subnet_name" {
#   value = azurerm_subnet.d_bricks_host_subnet.name
# }

# output "d_bricks_host_subnet_id" {
#   value = azurerm_subnet.d_bricks_host_subnet.id
# }

# output "d_bricks_host_subnet_address_prefixes" {
#   value = azurerm_subnet.d_bricks_host_subnet.address_prefixes
# }

# output "pe_d_bricks_cp_subnet_name" {
#   value = azurerm_subnet.pe_d_bricks_cp_subnet.name
# }

# output "pe_d_bricks_cp_subnet_id" {
#   value = azurerm_subnet.pe_d_bricks_cp_subnet.id
# }

# output "pe_d_bricks_cp_subnet_address_prefixes" {
#   value = azurerm_subnet.pe_d_bricks_cp_subnet.address_prefixes
# }

# output "pe_d_bricks_managed_storage_subnet_name" {
#   value = azurerm_subnet.pe_d_bricks_managed_storage_subnet.name
# }

# output "pe_d_bricks_managed_storage_subnet_id" {
#   value = azurerm_subnet.pe_d_bricks_managed_storage_subnet.id
# }

# output "pe_d_bricks_managed_storage_subnet_address_prefixes" {
#   value = azurerm_subnet.pe_d_bricks_managed_storage_subnet.address_prefixes
# }

output "ml_batch_account_subnet_name" {
  value = azurerm_subnet.ml_batch_account_subnet.name
}

output "ml_batch_account_subnet_id" {
  value = azurerm_subnet.ml_batch_account_subnet.id
}

output "ml_batch_account_subnet_address_prefixes" {
  value = azurerm_subnet.ml_batch_account_subnet.address_prefixes
}

output "ml_function_app_subnet_name" {
  value = azurerm_subnet.ml_function_app_subnet.name
}

output "ml_function_app_subnet_id" {
  value = azurerm_subnet.ml_function_app_subnet.id
}

output "ml_function_app_subnet_address_prefixes" {
  value = azurerm_subnet.ml_function_app_subnet.address_prefixes
}

output "ml_pe_subnet_name" {
  value = azurerm_subnet.ml_pe_subnet.name
}

output "ml_pe_subnet_id" {
  value = azurerm_subnet.ml_pe_subnet.id
}

output "ml_pe_subnet_address_prefixes" {
  value = azurerm_subnet.ml_pe_subnet.address_prefixes
}

output "lss_batch_account_subnet_name" {
  value = azurerm_subnet.lss_batch_account_subnet.name
}

output "lss_batch_account_subnet_id" {
  value = azurerm_subnet.lss_batch_account_subnet.id
}

output "lss_batch_account_subnet_address_prefixes" {
  value = azurerm_subnet.lss_batch_account_subnet.address_prefixes
}

output "lss_function_app_subnet_subnet_name" {
  value = azurerm_subnet.lss_function_app_subnet.name
}

output "lss_function_app_subnet_subnet_id" {
  value = azurerm_subnet.lss_function_app_subnet.id
}

output "lss_function_app_subnet_address_prefixes" {
  value = azurerm_subnet.lss_function_app_subnet.address_prefixes
}

output "lss_pe_subnet_subnet_name" {
  value = azurerm_subnet.lss_pe_subnet.name
}

output "lss_pe_subnet_subnet_id" {
  value = azurerm_subnet.lss_pe_subnet.id
}

output "lss_pe_subnet_address_prefixes" {
  value = azurerm_subnet.lss_pe_subnet.address_prefixes
}


output "inv_vm_subnet_id" {
  value = azurerm_subnet.inv_vm_subnet.id
}

output "inv_db_subnet_subnet_name" {
  value = azurerm_subnet.inv_db_subnet.name
}

output "inv_db_subnet_id" {
  value = azurerm_subnet.inv_db_subnet.id
}

output "inv_db_subnet_address_prefixes" {
  value = azurerm_subnet.inv_db_subnet.address_prefixes
}

output "inv_function_app_subnet_subnet_name" {
  value = azurerm_subnet.inv_function_app_subnet.name
}

output "inv_function_app_subnet_subnet_id" {
  value = azurerm_subnet.inv_function_app_subnet.id
}

output "inv_function_app_subnet_address_prefixes" {
  value = azurerm_subnet.inv_function_app_subnet.address_prefixes
}

output "inv_pe_subnet_subnet_name" {
  value = azurerm_subnet.inv_pe_subnet.name
}

output "inv_pe_subnet_subnet_id" {
  value = azurerm_subnet.inv_pe_subnet.id
}

output "inv_pe_subnet_address_prefixes" {
  value = azurerm_subnet.inv_pe_subnet.address_prefixes
}

output "event_hub_pe_subnet_subnet_name" {
  value = azurerm_subnet.event_hub_pe_subnet.name
}

output "event_hub_pe_subnet_subnet_id" {
  value = azurerm_subnet.event_hub_pe_subnet.id
}

output "event_hub_pe_subnet_address_prefixes" {
  value = azurerm_subnet.event_hub_pe_subnet.address_prefixes
}


# output "ch_db_subnet_name" {
#   value = azurerm_subnet.ch_db_subnet.name
# }





# output "bastion_subnet_name" {
#   value = azurerm_subnet.bastion_subnet.name
# }

# output "db_subnet_address_prefixes" {
#   value = azurerm_subnet.db_subnet.address_prefixes
# }
# output "ch_db_subnet_address_prefixes" {
#   value = azurerm_subnet.ch_db_subnet.address_prefixes
# }



# output "bastion_subnet_address_prefixes" {
#   value = azurerm_subnet.bastion_subnet.address_prefixes
# }


# output "ch_db_subnet_id" {
#   value = azurerm_subnet.ch_db_subnet.id
# }
output "private_endpoint_id" {
  value = azurerm_subnet.sensor_pe_subnet.id
}
output "batchaccount_id" {
  value = azurerm_subnet.sensor_batch_account_subnet.id
}
output "functionapp_subnet_id" {
  value = azurerm_subnet.sensor_functionapp_subnet.id
}
# output "bastion_subnet_id" {
#   value = azurerm_subnet.bastion_subnet.id
# }
