output "aks_ch_subnet_id" {
  value = azurerm_subnet.aks_ch_subnet.id
}

output "aks_ch_subnet_name" {
  value = azurerm_subnet.aks_ch_subnet.name
}

output "aks_ch_address_prefix" {
  value = azurerm_subnet.aks_ch_subnet.address_prefixes
}

output "private_endpoint_ch_subnet_name" {
  value = azurerm_subnet.ch_pe_subnet.name
}

output "ch_pe_subnet_id" {
  value = azurerm_subnet.ch_pe_subnet.id
}

output "private_endpoint_ch_address_prefix" {
  value = azurerm_subnet.ch_pe_subnet.address_prefixes
}

output "appgtw_ch_subnet_id" {
  value = azurerm_subnet.ch_appgtw_subnet.id
}

output "appgtw_ch_subnet_name" {
  value = azurerm_subnet.ch_appgtw_subnet.name
}

output "ch_db_subnet_name" {
  value = azurerm_subnet.ch_db_subnet.name
}

output "ch_db_subnet_id" {
  value = azurerm_subnet.ch_db_subnet.id
}


output "ch_db_subnet_address_prefix" {
  value = azurerm_subnet.ch_db_subnet.address_prefixes
}

# output "function_app_ch_subnet_name" {
#   value = azurerm_subnet.function_app_ch_subnet.name
# }
# output "function_app_ch_address_prefix" {
#   value = azurerm_subnet.function_app_ch_subnet.address_prefixes
# }

# output "machine_learning_ch_subnet_name" {
#   value = azurerm_subnet.machine_learning_ch_subnet.name
# }
# output "machine_learning_ch_address_prefix" {
#   value = azurerm_subnet.machine_learning_ch_subnet.address_prefixes
# }

# output "virtual_machine_ch_subnet_name" {
#   value = azurerm_subnet.virtual_machine_ch_subnet.name
# }
# output "virtual_machine_ch_address_prefix" {
#   value = azurerm_subnet.virtual_machine_ch_subnet.address_prefixes
# }



# output "private_endpoint_ch_subnet_id" {
#   value = azurerm_subnet.private_endpoint_ch_subnet.id
# }

# output "aks_ch_subnet" {
#   value = azurerm_subnet.aks_ch_subnet.id
# }

# output "virtual_machine_ch_subnet_id" {
#   value = azurerm_subnet.virtual_machine_ch_subnet.id
# }
# output "machine_learning_ch_subnet_id" {
#   value = azurerm_subnet.machine_learning_ch_subnet.id
# }
# output "function_app_ch_subnet_id" {
#   value = azurerm_subnet.function_app_ch_subnet.id
# }