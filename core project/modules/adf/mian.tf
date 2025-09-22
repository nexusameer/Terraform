######################################################################################
##                                                                                  ##
##                           Data Factory                                           ##
##                                                                                  ##
######################################################################################

resource "azurerm_data_factory" "az-adf-we-core" {
  provider            = azurerm.core
  name                = var.adf_name
  location            = var.core_rg_location
  resource_group_name = var.core_rg
  identity {
    type = "SystemAssigned"
  }
  managed_virtual_network_enabled = true
  tags = merge(
    var.tags,
    { environment = var.environment
    }
  )
}





######################################################################################
##                                                                                  ##
##                           Data Factory Integration                               ##
##                                                                                  ##
######################################################################################

resource "azurerm_data_factory_integration_runtime_azure" "adf_integration" {
  provider                = azurerm.core
  name                    = "AutoResolveIntegrationRuntime"
  data_factory_id         = azurerm_data_factory.az-adf-we-core.id
  location                = "AutoResolve" #azurerm_resource_group.az_rg_we_core.location
  virtual_network_enabled = true
  depends_on              = [azurerm_data_factory.az-adf-we-core]
}




# ######################################################################################
# ##                                                                                  ##
# ##                           Function App Managed PE                                ##
# ##                                                                                  ##
# ######################################################################################

# resource "azurerm_data_factory_managed_private_endpoint" "fap_private_endpoint" {
#   provider           = azurerm.core
#   name               = var.fap_pe_name
#   data_factory_id    = azurerm_data_factory.az-adf-we-core.id
#   target_resource_id = var.fap_id
#   subresource_name   = "sites"
#   # timeouts {
#   #   create = "60m" # Adjust as needed
#   #   # update = "60m"
#   #   delete = "60m"
#   # }

# }



######################################################################################
##                                                                                  ##
##                           Data Lake Managed PE                                   ##
##                                                                                  ##
######################################################################################


resource "azurerm_data_factory_managed_private_endpoint" "datalake_private_endpoint" {
  provider           = azurerm.core
  name               = var.datalake_private_endpoint_name
  data_factory_id    = azurerm_data_factory.az-adf-we-core.id
  target_resource_id = var.datalake_id
  subresource_name   = "dfs"
  depends_on         = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_integration_runtime_azure.adf_integration]
}



######################################################################################
##                                                                                  ##
##                           Storage Account  Managed PE                            ##
##                                                                                  ##
######################################################################################

resource "azurerm_data_factory_managed_private_endpoint" "storage_private_endpoint" {
  provider           = azurerm.core
  name               = var.storage_private_endpoint_name
  data_factory_id    = azurerm_data_factory.az-adf-we-core.id
  target_resource_id = var.storage_account_id
  subresource_name   = "dfs"
  depends_on         = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_integration_runtime_azure.adf_integration]
}


######################################################################################
##                                                                                  ##
##                           Function App Managed PE                                ##
##                                                                                  ##
######################################################################################

resource "azurerm_data_factory_managed_private_endpoint" "fap_private_endpoint" {
  provider           = azurerm.core
  name               = var.fap_pe_name
  data_factory_id    = azurerm_data_factory.az-adf-we-core.id
  target_resource_id = var.fap_id
  subresource_name   = "sites"
  depends_on         = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_integration_runtime_azure.adf_integration]

}

######################################################################################
##                                                                                  ##
##                           Key Vault Managed PE                                   ##
##                                                                                  ##
######################################################################################


resource "azurerm_data_factory_managed_private_endpoint" "keyvault_managed_private_endpoint" {
  provider           = azurerm.core
  name               = var.vault_private_endpoint_name
  data_factory_id    = azurerm_data_factory.az-adf-we-core.id
  target_resource_id = var.key_vault_id
  subresource_name   = "vault"
  depends_on         = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_integration_runtime_azure.adf_integration]
}


######################################################################################
##                                                                                  ##
##                           Datalake Linked Service                                ##
##                                                                                  ##
######################################################################################

resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "datalake_linked_service" {
  name                     = var.datalake_linked_name
  provider                 = azurerm.core
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.adf_integration.name
  use_managed_identity     = true
  url                      = var.datalake_url
  data_factory_id          = azurerm_data_factory.az-adf-we-core.id
  depends_on               = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_managed_private_endpoint.datalake_private_endpoint, azurerm_data_factory_managed_private_endpoint.storage_private_endpoint, azurerm_data_factory_managed_private_endpoint.fap_private_endpoint]

}




# ######################################################################################
# ##                                                                                  ##
# ##                           Storage Account Linked Service                         ##
# ##                                                                                  ##
# ######################################################################################


resource "azurerm_data_factory_linked_service_data_lake_storage_gen2" "blob_linked_service" {
  name                     = var.core_storage_account_name
  provider                 = azurerm.core
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.adf_integration.name
  use_managed_identity     = true
  url                      = var.storage_account_url
  data_factory_id          = azurerm_data_factory.az-adf-we-core.id
  depends_on               = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_managed_private_endpoint.datalake_private_endpoint, azurerm_data_factory_managed_private_endpoint.storage_private_endpoint, azurerm_data_factory_managed_private_endpoint.fap_private_endpoint]

}





resource "azurerm_data_factory_linked_service_key_vault" "keyvauly_linked_service" {
  provider                 = azurerm.core
  name                     = var.keyvault_linked_name
  data_factory_id          = azurerm_data_factory.az-adf-we-core.id
  key_vault_id             = var.key_vault_id
  integration_runtime_name = azurerm_data_factory_integration_runtime_azure.adf_integration.name
  depends_on               = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_managed_private_endpoint.datalake_private_endpoint, azurerm_data_factory_managed_private_endpoint.storage_private_endpoint, azurerm_data_factory_managed_private_endpoint.fap_private_endpoint, azurerm_data_factory_managed_private_endpoint.keyvault_managed_private_endpoint]
}






######################################################################################
##                                                                                  ##
##                           Function App Linked Service                            ##
##                                                                                  ##
######################################################################################


resource "azurerm_data_factory_linked_service_azure_function" "function_app_lined_service" {
  provider        = azurerm.core
  name            = var.function_app_name
  data_factory_id = azurerm_data_factory.az-adf-we-core.id
  url             = var.function_app_default_hostname
  key             = "foo"
  depends_on      = [azurerm_data_factory.az-adf-we-core, azurerm_data_factory_managed_private_endpoint.datalake_private_endpoint, azurerm_data_factory_managed_private_endpoint.storage_private_endpoint]
}



# # ######################################################################################
# # ##                                                                                  ##
# # ##                        KeyVault Managed Private Endpoint                         ##
# # ##                                                                                  ##
# # ######################################################################################

# resource "null_resource" "private_managed" {
#   provisioner "local-exec" {
#     command     = <<EOT
#       set -e
#       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#       az account set --subscription "${var.subscriptions_id}"
#       echo "Checking if Managed Private Endpoint ${var.vault_private_endpoint_name} exists..."

#       # Fetch the private-link-resource-id dynamically using Azure CLI
#       private_link_resource_id=$(az keyvault show \
#         --resource-group "${var.core_rg}" \
#         --name "${var.keyvault_name}" \
#         --query id -o tsv)

#       # If private-link-resource-id exists
#       if [ -z "$private_link_resource_id" ]; then
#         echo "KeyVault not found! Please check the KeyVault name."
#         exit 1
#       fi

#       echo "Private Link Resource ID: $private_link_resource_id"

#       # Check if Managed Private Endpoint exists
#       if ! az datafactory managed-private-endpoint show \
#             --resource-group "${var.core_rg}" \
#             --factory-name "${var.adf_name}" \
#             --name ${var.vault_private_endpoint_name} > /dev/null 2>&1; then
#         echo "Creating Managed Private Endpoint ${var.vault_private_endpoint_name}..."

#         # Create Managed Private Endpoint
#         az datafactory managed-private-endpoint create \
#           --resource-group "${var.core_rg}" \
#           --factory-name "${var.adf_name}" \
#           --managed-virtual-network-name default \
#           --name ${var.vault_private_endpoint_name} \
#           --private-link-resource-id "$private_link_resource_id" \
#           --group-id "vault"
#       else
#         echo "Managed Private Endpoint ${var.vault_private_endpoint_name} already exists. Skipping creation."
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }


#   triggers = {
#     always_run = timestamp()
#   }
#   depends_on = [azurerm_data_factory.az-adf-we-core]
# }




# # ######################################################################################
# # ##                                                                                  ##
# # ##                           KeyVault Linked Service                                ##
# # ##                                                                                  ##
# # ######################################################################################
# resource "null_resource" "private_link" {
#   provisioner "local-exec" {
#     command     = <<EOT
#       set -e
#       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#       az account set --subscription "${var.subscriptions_id}"
#       echo "Checking if Linked Service ${var.keyvault_linked_name} exists..."
#       if ! az datafactory linked-service show \
#             --resource-group "${var.core_rg}" \
#             --factory-name "${var.adf_name}" \
#             --name ${var.keyvault_linked_name} > /dev/null 2>&1; then
#         echo "Creating Linked Service ${var.keyvault_linked_name}..."
#         az datafactory linked-service create \
#           --resource-group "${var.core_rg}" \
#           --factory-name "${var.adf_name}" \
#           --name ${var.keyvault_linked_name} \
#           --properties '{"type": "AzureKeyVault", "typeProperties": {"baseUrl": "${var.keyvault_url}", "managedPrivateEndpoint": {"referenceName": "${var.keyvault_linked_name}", "type": "ManagedPrivateEndpointReference"}}, "connectVia": {"referenceName": "AutoResolveIntegrationRuntime", "type": "IntegrationRuntimeReference"}}'
#       else
#         echo "Linked Service ${var.keyvault_linked_name} already exists. Skipping creation."
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }


#   triggers = {
#     always_run = timestamp()
#   }
# }


# resource "null_resource" "approve_private_endpoint" {
#   depends_on = [null_resource.private_managed]
#   provisioner "local-exec" {
#     command = " az account set --subscription ${var.subscriptions_id} && az keyvault private-endpoint-connection approve --name ${var.keyvault_connection_name} --vault-name ${var.az_kv_name} --resource-group ${var.core_rg} --description 'Approved via Terraform'"
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }


# # # Datalake Account Private Connection Approved

# resource "null_resource" "storage_account_approve_private_endpoint" {
#   depends_on = [azurerm_data_factory_managed_private_endpoint.storage_private_endpoint]

#   provisioner "local-exec" {
#     command     = <<EOT
#        az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#        az account set --subscription "${var.subscriptions_id}"
#       # Define the connection ID
#       connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections"

#       # Get the connection name dynamically
#       connection_name=$(az network private-endpoint-connection list \
#         --resource-group ${var.core_rg} \
#         --name ${var.azsawestagingcore} \
#         --type Microsoft.Storage/storageAccounts \
#         --query "[0].name" -o tsv)

#       # Get the current status
#       connection_state=$(az resource show \
#         --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections/$connection_name" \
#         --query "properties.privateLinkServiceConnectionState.status" -o tsv)

#       # If the state is "Pending", approve it
#       if [ "$connection_state" == "Pending" ]; then
#         echo "Approving private endpoint connection..."
#         az network private-endpoint-connection approve \
#           --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections/$connection_name" \
#           --description "Approved via Terraform"
#         echo "Private Endpoint Connection Approved."
#       else
#         echo "No action needed. Current state: $connection_state"
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }


# resource "null_resource" "datalake_approve_private_endpoint" {
#   depends_on = [azurerm_data_factory_managed_private_endpoint.datalake_private_endpoint]

#   provisioner "local-exec" {
#     command     = <<EOT
#       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#       az account set --subscription "${var.subscriptions_id}"
#       # Define the connection ID
#       connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections"

#       # Get the connection name dynamically
#       connection_name=$(az network private-endpoint-connection list \
#         --resource-group ${var.core_rg} \
#         --name ${var.datalake_name} \
#         --type Microsoft.Storage/storageAccounts \
#         --query "[1].name" -o tsv)

#       # Get the current status
#       connection_state=$(az resource show \
#         --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections/$connection_name" \
#         --query "properties.privateLinkServiceConnectionState.status" -o tsv)

#       # If the state is "Pending", approve it
#       if [ "$connection_state" == "Pending" ]; then
#         echo "Approving private endpoint connection..."
#         az network private-endpoint-connection approve \
#           --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections/$connection_name" \
#           --description "Approved via Terraform"
#         echo "Private Endpoint Connection Approved."
#       else
#         echo "No action needed. Current state: $connection_state"
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }




# resource "null_resource" "function_app_approve_private_endpoint" {
#   depends_on = [azurerm_data_factory_managed_private_endpoint.fap_private_endpoint]

#   provisioner "local-exec" {
#     command     = <<EOT
#       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#       az account set --subscription "${var.subscriptions_id}"
#       # Define the connection ID
#       connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections"

#       # Get the connection name dynamically
#       connection_name=$(az network private-endpoint-connection list \
#         --resource-group ${var.core_rg} \
#         --name ${var.function_app_name} \
#         --type microsoft.web/sites \
#         --query "[1].name" -o tsv)

#       # Get the current status
#       connection_state=$(az resource show \
#         --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections/$connection_name" \
#         --query "properties.privateLinkServiceConnectionState.status" -o tsv)

#       # If the state is "Pending", approve it
#       if [ "$connection_state" == "Pending" ]; then
#         echo "Approving private endpoint connection..."
#         az network private-endpoint-connection approve \
#           --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.core_rg}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections/$connection_name" \
#           --description "Approved via Terraform"
#         echo "Private Endpoint Connection Approved."
#       else
#         echo "No action needed. Current state: $connection_state"
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }

#   triggers = {
#     always_run = timestamp()
#   }
# }


