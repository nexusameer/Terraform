################################################# Appp service Outputs ###################################################

output "az_app_service_plan_name" {
  value = module.appservice.az_app_service_plan_name
}

output "sensor_app_service_name" {
  value = module.appservice.sensor_app_service_name
}

output "app_service_private_endpoint_name" {
  value = module.appservice.app_service_private_endpoint_name
}

output "private_ip_of_app_data_endpoint" {
  value = module.appservice.app_service_private_dns_a_record_ip_scm
}

# output "private_ip_of_app_acr_endpoint" {
#   value = module.appservice.private_ip_of_app_acr_endpoint
# }

################################################# Appp container registry Outputs ###################################################

output "container_registry_name" {
  value = module.apps_container_registry.container_registry_name
}

output "apps_acr_private_endpoint_name" {
  value = module.apps_container_registry.apps_acr_private_endpoint_name
}

# output "app_private_dns_a_record_in_core_acr_name" {
#   value = module.apps_container_registry.app_private_dns_a_record_in_core_acr_name
# }

# output "app_private_dns_data_a_record_in_core_acr_name" {
#   value = module.apps_container_registry.app_private_dns_data_a_record_in_core_acr_name
# }

# output "private_ip_of_acr_data_endpoint" {
#   value = module.apps_container_registry.private_ip_of_acr_data_endpoint
# }

output "private_ip_of_acr_data_endpoint" {
  value = module.apps_container_registry.private_dns_a_record_ip
}

output "private_ip_of_acr_endpoint" {
  value = module.apps_container_registry.private_dns_a_record_ip_data
}

################################################# Shiny vm Outputs ###################################################

output "shiny_vm_name" {
  value = module.shinyvm.shiny_vm_name
}

output "storage_account_name" {
  value = module.shinyvm.storage_account_name
}

################################################# Control Panel App Outputs ###################################################
output "control_panel_app_service_name" {
  value = module.control_panel_appservice.control_panel_app_service_name
}

output "control_app_acr_pull_role_name" {
  value = module.control_panel_appservice.control_app_acr_pull_role_name
}

output "control_app_service_keyvault_role_name" {
  value = module.control_panel_appservice.control_app_service_keyvault_role_name
}

output "private_ip_of_control_app_data_endpoint" {
  value = module.control_panel_appservice.cp_app_service_private_dns_a_record_ip_scm
}

# output "private_ip_of_control_app_acr_endpoint" {
#   value = module.control_panel_appservice.private_ip_of_control_app_acr_endpoint
# }

