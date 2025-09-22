# output "aks_cluster_name" {
#   description = "The name of the AKS cluster"
#   value       = module.aks.cluster_name
# }

# output "eventhub_name" {
#   description = "The name of the Event Hub"
#   value       = module.event_hub.eventhub_name
# }

# output "eventhub_namespace" {
#   description = "The name of the Event Hub namespace"
#   value       = module.event_hub.namespace_name
# }

# output "eventhub_consumer_groups" {
#   description = "The consumer groups created for the Event Hub"
#   value       = module.event_hub.consumer_groups
# }

output "resource_group_name" {
  value = module.import_resources.resource_group_name
}

output "core_vnet_id" {
  value = module.import_resources.core_vnet_name
}

# output "core_subnet_id" {
#   value = module.import_resources.core_db_subnet_id
# }

output "kube_config" {
  value     = module.aks.kube_config
  sensitive = true
}

# output "aks_private_endpoint_name" {
#   value = module.aks.aks_dns_name
# }

output "fqdn" {
  value = module.aks.fqdn
}

output "lss_service_plan_id" {
  value = module.lss_functionapp_service_plan.function_app_sevice_plan_id
}

output "inv_service_plan_id" {
  value = module.inv_functionapp_service_plan.function_app_sevice_plan_id
}

output "ml_service_plan_id" {
  value = module.ml_functionapp_service_plan.function_app_sevice_plan_id
}

# output "ecs_domain_id" {
#   value = module.ch_email_communication_service.ecs_domain_id
# }

# output "from_sender_domain" {
#   value = module.ch_email_communication_service.from_sender_domain
# }

# output "mail_from_sender_domain" {
#   value = module.ch_email_communication_service.mail_from_sender_domain
# }

# output "acs_primary_key" {
#   value = module.ch_communication_service.primary_key
#   sensitive = true
# } 

# output "acs_secondary_key" {
#   value = module.ch_communication_service.secondary_key
#   sensitive = true
# }


# output "app_registration_name" {
#   value = module.app_registration.ecoral_app_name
# }
