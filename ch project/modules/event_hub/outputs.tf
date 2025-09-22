# output "namespace_name" {
#   description = "The name of the Event Hub namespace"
#   value       = azurerm_eventhub_namespace.namespace.name
# }

# output "eventhub_name" {
#   description = "The name of the Event Hub"
#   value       = azurerm_eventhub.eventhub.name
# }

# output "consumer_groups" {
#   description = "The consumer groups created for the Event Hub"
#   value       = [for cg in azurerm_eventhub_consumer_group.consumer_groups : cg.name]
# }
output "eventhub_namespace_core_name" {
  value = azurerm_eventhub_namespace.eventhub_namespace_core.name
}

output "eventhub_namespace_core_id" {
  value = azurerm_eventhub_namespace.eventhub_namespace_core.id
}

output "eventhub_namespace_ch_name" {
  value = azurerm_eventhub_namespace.eventhub_namespace_ch.name
}

output "eventhub_namespace_core_primary_key" {
  value = azurerm_eventhub_namespace.eventhub_namespace_core.default_primary_key
}
# output "eventhub_namespace_aks_name" {
#   value = azurerm_eventhub_namespace.eventhub_namespace_aks.name
# }

# output "eventhub_namespace_k8_name" {
#   value = azurerm_eventhub_namespace.eventhub_namespace_k8.name
# }

output "eventhub_namespace_ch_id" {
  value = azurerm_eventhub_namespace.eventhub_namespace_ch.id
}

output "core_eventhub_namespace_access_keys" {
  value     = azurerm_eventhub_namespace_authorization_rule.eh_lss_rule.primary_key
  sensitive = true
}