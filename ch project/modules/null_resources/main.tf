
resource "null_resource" "function_app_approve_private_endpoint" {

  provisioner "local-exec" {
    command     = <<EOT
      az login --service-principal -u "${var.azure_client_id}" -p "${var.azure_client_secret}" --tenant "${var.azure_tenant_id}"
      az account set --subscription "${var.subscriptions_id}"
      # Define the connection ID
      connection_id="/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.ml_function_app_name}/privateEndpointConnections"

      # Get the connection name dynamically
      connection_name=$(az network private-endpoint-connection list \
        --resource-group ${var.rg_name} \
        --name ${var.ml_function_app_name} \
        --type microsoft.web/sites \
        --query "[?properties.privateLinkServiceConnectionState.status=='Pending'].name" \
        --output tsv)

      # Get the current status
      connection_state=$(az resource show \
        --ids "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.ml_function_app_name}/privateEndpointConnections/$connection_name" \
        --query "properties.privateLinkServiceConnectionState.status" -o tsv)

      # If the state is "Pending", approve it
      if [ "$connection_state" == "Pending" ]; then
        echo "Approving private endpoint connection..."
        az network private-endpoint-connection approve \
          --id "/subscriptions/${var.subscriptions_id}/resourceGroups/${var.rg_name}/providers/microsoft.web/sites/${var.ml_function_app_name}/privateEndpointConnections/$connection_name" \
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
