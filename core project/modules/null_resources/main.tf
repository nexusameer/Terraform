
# ######################################################################################
# ##                                                                                  ##
# ##                        KeyVault Managed Private Endpoint                         ##
# ##                                                                                  ##
# ######################################################################################

# resource "null_resource" "private_managed" {
#   provisioner "local-exec" {
#     command     = <<EOT
#       set -e
#       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
#       az account set --subscription "${var.subscriptions_id}"
#       echo "Checking if Managed Private Endpoint ${var.vault_private_endpoint_name} exists..."

#       # Fetch the private-link-resource-id dynamically using Azure CLI
#       private_link_resource_id=$(az keyvault show \
#         --resource-group "${var.rg_name}" \
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
#             --resource-group "${var.rg_name}" \
#             --factory-name "${var.adf_name}" \
#             --managed-virtual-network-name default \
#             --name ${var.vault_private_endpoint_name} > /dev/null 2>&1; then
#         echo "Creating Managed Private Endpoint ${var.vault_private_endpoint_name}..."

#         # Create Managed Private Endpoint
#         az datafactory managed-private-endpoint create \
#           --resource-group "${var.rg_name}" \
#           --factory-name "${var.adf_name}" \
#           --managed-virtual-network-name default \
#           --name ${var.vault_private_endpoint_name} \
#           --private-link-resource-id "$private_link_resource_id" \
#           --group-id "vault"

#         # Wait for provisioning to complete
#         echo "Waiting for Managed Private Endpoint to be in 'Succeeded' state..."

#         while true; do
#           STATUS=$(az datafactory managed-private-endpoint show \
#             --resource-group "${var.rg_name}" \
#             --factory-name "${var.adf_name}" \
#             --name "${var.vault_private_endpoint_name}" \
#             --managed-virtual-network-name default \
#             --query "properties.provisioningState" -o tsv)

#           echo "Current status: $STATUS"

#           if [[ "$STATUS" == "Succeeded" ]]; then
#             echo "Managed Private Endpoint ${var.vault_private_endpoint_name} is successfully provisioned."
#             break
#           elif [[ "$STATUS" == "Failed" ]]; then
#             echo "Managed Private Endpoint provisioning failed."
#             exit 1
#           fi

#           # Wait before checking again
#           sleep 10
#         done


#       else
#         echo "Managed Private Endpoint ${var.vault_private_endpoint_name} already exists. Skipping creation."
#       fi
#     EOT
#     interpreter = ["/bin/bash", "-c"]
#   }


#   triggers = {
#     always_run = timestamp()
#   }
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
#             --resource-group "${var.rg_name}" \
#             --factory-name "${var.adf_name}" \
#             --name ${var.keyvault_linked_name} > /dev/null 2>&1; then
#         echo "Creating Linked Service ${var.keyvault_linked_name}..."
#         az datafactory linked-service create \
#           --resource-group "${var.rg_name}" \
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

#########Commented by Zamran##############

resource "null_resource" "approve_private_endpoint" {
  depends_on = [
    # null_resource.private_link,
    # null_resource.private_managed
  ]
  provisioner "local-exec" {
    command = "az login --service-principal -u ${var.azure_client_id} -p ${var.azure_client_secret} --tenant ${var.azure_tenant_id} && az account set --subscription ${var.subscriptions_id} && az keyvault private-endpoint-connection approve --name ${var.keyvault_connection_name} --vault-name ${var.keyvault_name} --resource-group ${var.rg_name} --description 'Approved via Terraform'"
  }

  triggers = {
    always_run = timestamp()
  }
}
#########Commented by Zamran##############

# # Datalake Account Private Connection Approved

resource "null_resource" "storage_account_approve_private_endpoint" {
  provisioner "local-exec" {
    command     = <<EOT
       az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
       az account set --subscription "${var.subscriptions_id}"
      # Define the connection ID
      connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections"

      # Get the connection name dynamically
      connection_name=$(az network private-endpoint-connection list \
        --resource-group ${var.rg_name} \
        --name ${var.azsawestagingcore} \
        --type Microsoft.Storage/storageAccounts \
        --query "[?properties.privateLinkServiceConnectionState.status=='Pending'].name" \
        --output tsv)

      # Get the current status
      connection_state=$(az resource show \
        --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections/$connection_name" \
        --query "properties.privateLinkServiceConnectionState.status" -o tsv)

      # If the state is "Pending", approve it
      if [ "$connection_state" == "Pending" ]; then
        echo "Approving private endpoint connection..."
        az network private-endpoint-connection approve \
          --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.azsawestagingcore}/privateEndpointConnections/$connection_name" \
          --description "Approved via Terraform"
        echo "Private Endpoint Connection Approved."
      else
        echo "No action needed. Current state: $connection_state"
      fi
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    always_run = timestamp()
  }
}


resource "null_resource" "datalake_approve_private_endpoint" {
  provisioner "local-exec" {
    command     = <<EOT
      az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
      az account set --subscription "${var.subscriptions_id}"
      # Define the connection ID
      connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections"

      # Get the connection name dynamically
      connection_name=$(az network private-endpoint-connection list \
        --resource-group ${var.rg_name} \
        --name ${var.datalake_name} \
        --type Microsoft.Storage/storageAccounts \
        --query "[?properties.privateLinkServiceConnectionState.status=='Pending'].name" \
        --output tsv)

      # Get the current status
      connection_state=$(az resource show \
        --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections/$connection_name" \
        --query "properties.privateLinkServiceConnectionState.status" -o tsv)

      # If the state is "Pending", approve it
      if [ "$connection_state" == "Pending" ]; then
        echo "Approving private endpoint connection..."
        az network private-endpoint-connection approve \
          --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/Microsoft.Storage/storageAccounts/${var.datalake_name}/privateEndpointConnections/$connection_name" \
          --description "Approved via Terraform"
        echo "Private Endpoint Connection Approved."
      else
        echo "No action needed. Current state: $connection_state"
      fi
    EOT
    interpreter = ["/bin/bash", "-c"]
  }

  triggers = {
    always_run = timestamp()
  }
}




resource "null_resource" "function_app_approve_private_endpoint" {

  provisioner "local-exec" {
    command     = <<EOT
      az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
      az account set --subscription "${var.subscriptions_id}"
      # Define the connection ID
      connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections"

      # Get the connection name dynamically
      connection_name=$(az network private-endpoint-connection list \
        --resource-group ${var.rg_name} \
        --name ${var.function_app_name} \
        --type microsoft.web/sites \
        --query "[?properties.privateLinkServiceConnectionState.status=='Pending'].name" \
        --output tsv)

      # Get the current status
      connection_state=$(az resource show \
        --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections/$connection_name" \
        --query "properties.privateLinkServiceConnectionState.status" -o tsv)

      # If the state is "Pending", approve it
      if [ "$connection_state" == "Pending" ]; then
        echo "Approving private endpoint connection..."
        az network private-endpoint-connection approve \
          --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.function_app_name}/privateEndpointConnections/$connection_name" \
          --description "Approved via Terraform"
        echo "Private Endpoint Connection Approved."
      else
        echo "No action needed. Current state: $connection_state"
      fi
    EOT
    interpreter = ["/bin/bash", "-c"]
  }
  triggers = {
    always_run = timestamp()
  }
}

