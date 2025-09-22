# ################################################# Core Outputs ###################################################

# output "resource_group_name" {
#   value = module.core_resource_group.resource_group_name
# }

# output "resource_group_location" {
#   value = module.core_resource_group.resource_group_location
# }

output "vnet_name" {
  value = module.core_vnet.vnet_name
}

output "vnet_address_space" {
  value = module.core_vnet.vnet_address_space
}

output "core_vnet_id" {
  value = module.core_vnet.core_vnet_id
}

output "gitlab_vnet_name" {
  value = module.import_resources.gitlab_vnet_name
}

output "gitlab_vnet_id" {
  value = module.import_resources.gitlab_vnet_id
}

output "gitlab_vnet_address_space" {
  value = module.import_resources.gitlab_vnet_address_space
}

output "kvap_vm_subnet_name" {
  value = module.kvap_subnet.kvap_vm_subnet_name
}

output "kvap_vm_subnet_address_prefixes" {
  value = module.kvap_subnet.kvap_vm_subnet_address_prefixes
}


# output "db_subnet_name" {
#   value = module.core_subnets.db_subnet_name
# }

# output "private_endpoint_subnet_name" {
#   value = module.core_subnets.private_endpoint_subnet_name
# }

output "batchaccount_subnet_name" {
  value = module.core_subnets.sensor_batch_account_subnet_name
}

# output "functionapp_subnet_name" {
#   value = module.core_subnets.functionapp_subnet_name
# }

# output "bastion_subnet_name" {
#   value = module.core_subnets.bastion_subnet_name
# }

# output "db_subnet_address_prefixes" {
#   value = module.core_subnets.db_subnet_address_prefixes
# }

# output "private_endpoint_address_prefixes" {
#   value = module.core_subnets.private_endpoint_address_prefixes
# }

output "batchaccount_address_prefixes" {
  value = module.core_subnets.sensor_batch_account_subnet_address_prefixes
}

# output "functionapp_subnet_prefixes" {
#   value = module.core_subnets.functionapp_subnet_prefixes
# }

# output "bastion_subnet_address_prefixes" {
#   value = module.core_subnets.bastion_subnet_address_prefixes
# }

# output "route_table_core_name" {
#   value = module.core_route_table.route_table_core_name
# }

# ################################################# APP Outputs ###################################################

# output "app_resource_group" {
#   value = module.app_resource_group.app_sensor_resource_group_name
# }

# output "app_sensor_resource_group_location" {
#   value = module.app_resource_group.app_sensor_resource_group_location
# }

output "app_sensor_vnet_name" {
  value = module.app_vnet.app_sensor_vnet_name
}

output "app_sensor_vnet_address_space" {
  value = module.app_vnet.app_sensor_vnet_address_space
}

output "app_sensor_vnet_id" {
  value = module.app_vnet.app_sensor_vnet_id
}

output "vnet_ch_name" {
  value = module.ch_vnet.vnet_ch_name
}

output "vnet_ch_address_space" {
  value = module.ch_vnet.vnet_ch_address_space
}

output "vnet_ch_id" {
  value = module.ch_vnet.vnet_ch_id
}

output "aks_ch_subnet_name" {
  value = module.ch_subnets.aks_ch_subnet_name
}

output "aks_ch_address_prefix" {
  value = module.ch_subnets.aks_ch_address_prefix
}

output "private_endpoint_ch_subnet_name" {
  value = module.ch_subnets.private_endpoint_ch_subnet_name
}


output "private_endpoint_ch_address_prefix" {
  value = module.ch_subnets.private_endpoint_ch_address_prefix
}

output "ch_db_subnet_name" {
  value = module.ch_subnets.ch_db_subnet_name
}

output "ch_db_subnet_address_prefix" {
  value = module.ch_subnets.ch_db_subnet_address_prefix
}





output "webapp_sensor_subnet_name" {
  value = module.app_subnets.webapp_sensor_subnet_name
}

output "webapp_sensor_address_prefix" {
  value = module.app_subnets.webapp_sensor_address_prefix
}

output "private_endpoint_sensor_subnet_name" {
  value = module.app_subnets.private_endpoint_sensor_subnet_name
}

output "private_endpoint_sensor_address_prefix" {
  value = module.app_subnets.private_endpoint_sensor_address_prefix
}

output "virtual_machine_sensor_name" {
  value = module.app_subnets.virtual_machine_sensor_name
}

output "virtual_machine_sensor_address_prefix" {
  value = module.app_subnets.virtual_machine_sensor_address_prefix
}

output "webapp_sensor_subnet_id" {
  value = module.app_subnets.webapp_sensor_subnet_id
}

output "virtual_machine_sensor_subnet_id" {
  value = module.app_subnets.virtual_machine_sensor_subnet_id
}

# output "route_table_app_name" {
#   value = module.app_route_table.route_table_app_name
# }

# ################################################# Kvap Outputs ###################################################

# output "kvap_rg_name" {
#   value = module.kvap_resource_group.kvap_rg_name
# }

# output "kvap_gpu_vm_subnet_name" {
#   value = module.kvap_subnet.vm_gpu_kvap_subnet_name
# }

# output "kvap_gpu_vm_subnet_ip_range" {
#   value = module.kvap_subnet.vm_gpu_kvap_subnet_ip_range
# }

# output "kvap_cpu_vm_subnet_name" {
#   value = module.kvap_subnet.vm_cpu_kvap_subnet_name
# }

# output "kvap_cpu_vm_subnet_ip_range" {
#   value = module.kvap_subnet.vm_cpu_kvap_subnet_ip_range
# }

output "kvap_vnet_name" {
  value = module.kvap_vnet.kvap_vnet_name
}

output "kvap_vnet_address_space" {
  value = module.kvap_vnet.kvap_vnet_address_space
}

output "kvap_vnet_id" {
  value = module.kvap_vnet.kvap_vnet_id
}

# ################################################# vnet peering Outputs ###################################################

# output "peering_we_sensor_to_core_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_sensor_to_core_name
# }

# output "peering_we_core_to_sensor_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_core_to_sensor_name
# }

# output "peering_we_gitlab_to_core_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_gitlab_to_core_name
# }

# output "peering_we_core_to_gitlab_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_core_to_gitlab_name
# }

# output "peering_we_gitlab_to_sensor_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_gitlab_to_sensor_name
# }

# output "peering_we_sensor_to_gitlab_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_sensor_to_gitlab_name
# }

# output "peering_we_kvap_to_core_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_kvap_to_core_name
# }

# output "peering_we_core_to_kvap_name" {
#   value = module.core_sensor_gitlab_kvap_peering.peering_we_core_to_kvap_name
# }

output "sensor_db_subnet" {
  value = module.core_subnets.sensor_db_subnet
}

output "sensor_db_address_prefixes" {
  value = module.core_subnets.sensor_db_address_prefixes
}

output "sensor_pe_subnet_name" {
  value = module.core_subnets.sensor_pe_subnet_name
}

output "sensor_pe_subnet_address_prefixes" {
  value = module.core_subnets.sensor_pe_subnet_address_prefixes
}

output "sensor_batch_account_subnet_name" {
  value = module.core_subnets.sensor_batch_account_subnet_name
}

output "sensor_batch_account_subnet_address_prefixes" {
  value = module.core_subnets.sensor_batch_account_subnet_address_prefixes
}

output "sensor_functionapp_subnet_name" {
  value = module.core_subnets.sensor_functionapp_subnet_name
}

output "sensor_functionapp_subnet_prefixes" {
  value = module.core_subnets.sensor_functionapp_subnet_prefixes
}

output "sensor_bastion_subnet_name" {
  value = module.core_subnets.sensor_bastion_subnet_name
}

output "sensor_bastion_address_prefixes" {
  value = module.core_subnets.sensor_bastion_address_prefixes
}


# output "d_bricks_container_subnet_name" {
#   value = module.core_subnets.d_bricks_container_subnet_name
# }

# output "d_bricks_container_subnet_address_prefixes" {
#   value = module.core_subnets.d_bricks_container_subnet_address_prefixes
# }

# output "d_bricks_host_subnet_name" {
#   value = module.core_subnets.d_bricks_host_subnet_name
# }

# output "d_bricks_host_subnet_address_prefixes" {
#   value = module.core_subnets.d_bricks_host_subnet_address_prefixes
# }

# output "pe_d_bricks_cp_subnet_name" {
#   value = module.core_subnets.pe_d_bricks_cp_subnet_name
# }

# output "pe_d_bricks_cp_subnet_address_prefixes" {
#   value = module.core_subnets.pe_d_bricks_cp_subnet_address_prefixes
# }


# output "pe_d_bricks_managed_storage_subnet_name" {
#   value = module.core_subnets.pe_d_bricks_managed_storage_subnet_name
# }

# output "pe_d_bricks_managed_storage_subnet_address_prefixes" {
#   value = module.core_subnets.pe_d_bricks_managed_storage_subnet_address_prefixes
# }

output "ml_batch_account_subnet_name" {
  value = module.core_subnets.ml_batch_account_subnet_name
}

output "ml_batch_account_subnet_address_prefixes" {
  value = module.core_subnets.ml_batch_account_subnet_address_prefixes
}

output "ml_function_app_subnet_name" {
  value = module.core_subnets.ml_function_app_subnet_name
}

output "ml_function_app_subnet_address_prefixes" {
  value = module.core_subnets.ml_function_app_subnet_address_prefixes
}

output "ml_pe_subnet_name" {
  value = module.core_subnets.ml_pe_subnet_name
}

output "ml_pe_subnet_address_prefixes" {
  value = module.core_subnets.ml_pe_subnet_address_prefixes
}

output "lss_batch_account_subnet_name" {
  value = module.core_subnets.lss_batch_account_subnet_name
}

output "lss_batch_account_subnet_address_prefixes" {
  value = module.core_subnets.lss_batch_account_subnet_address_prefixes
}

output "lss_function_app_subnet_subnet_name" {
  value = module.core_subnets.lss_function_app_subnet_subnet_name
}

output "lss_function_app_subnet_address_prefixes" {
  value = module.core_subnets.lss_function_app_subnet_address_prefixes
}

output "lss_pe_subnet_subnet_name" {
  value = module.core_subnets.lss_pe_subnet_subnet_name
}

output "lss_pe_subnet_address_prefixes" {
  value = module.core_subnets.lss_pe_subnet_address_prefixes
}

output "inv_db_subnet_subnet_name" {
  value = module.core_subnets.inv_db_subnet_subnet_name
}

output "inv_db_subnet_address_prefixes" {
  value = module.core_subnets.inv_db_subnet_address_prefixes
}

output "inv_function_app_subnet_subnet_name" {
  value = module.core_subnets.inv_function_app_subnet_subnet_name
}

output "inv_function_app_subnet_address_prefixes" {
  value = module.core_subnets.inv_function_app_subnet_address_prefixes
}

output "inv_pe_subnet_subnet_name" {
  value = module.core_subnets.inv_pe_subnet_subnet_name
}

output "inv_pe_subnet_address_prefixes" {
  value = module.core_subnets.inv_pe_subnet_address_prefixes
}

output "event_hub_pe_subnet_subnet_name" {
  value = module.core_subnets.event_hub_pe_subnet_subnet_name
}

output "event_hub_pe_subnet_address_prefixes" {
  value = module.core_subnets.event_hub_pe_subnet_address_prefixes
}

# output "sentinel_onboarding_id" {
#   value = module.sentinel.sentinel_onboarding_id
# }