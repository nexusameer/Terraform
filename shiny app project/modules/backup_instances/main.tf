data "azurerm_managed_disk" "vm_os_disk" {
  provider             = azurerm.app
  name                = "${var.shiny_vm_os_disk_name}-${var.environment}"
  resource_group_name = var.sensor_rg_name
}

resource "azurerm_role_assignment" "backup_vault_rg_access" {
  provider             = azurerm.app
  scope                = var.sensor_rg_id
  role_definition_name = "Contributor"
  principal_id         = var.backup_vault_principal_id
}

resource "azurerm_role_assignment" "backup_vault_os_disk_access" {
  provider             = azurerm.app
  scope                = data.azurerm_managed_disk.vm_os_disk.id
  role_definition_name = "Disk Backup Reader"
  principal_id         = var.backup_vault_principal_id
}

resource "azurerm_role_assignment" "backup_vault_azsawebootdiagapps_storage_account_access" {
  provider             = azurerm.app
  scope                = var.storage_account_id
  role_definition_name = "Contributor"
  principal_id         = var.backup_vault_principal_id
}

resource "azurerm_role_assignment" "backup_vault_storage_account_access" {
  provider             = azurerm.app
  scope                = var.storage_account_id
  role_definition_name = "Storage Account Backup Contributor"
  principal_id         = var.backup_vault_principal_id
}

resource "azurerm_data_protection_backup_policy_blob_storage" "app_storage_account_policy" {
  provider = azurerm.management
  name     = var.backup_vault_policy_name
  vault_id = var.backup_vault_id

  backup_repeating_time_intervals = ["R/2025-04-09T00:00:00+00:00/P1D"]

  operational_default_retention_duration = "P30D"
  lifecycle {
    ignore_changes = [
      backup_repeating_time_intervals
    ]
  }
}

resource "azurerm_data_protection_backup_instance_blob_storage" "azsawebootdiagapps_storage_account_instance" {
  depends_on       = [azurerm_role_assignment.backup_vault_rg_access, azurerm_role_assignment.backup_vault_azsawebootdiagapps_storage_account_access, azurerm_data_protection_backup_policy_blob_storage.app_storage_account_policy]
  provider         = azurerm.management
  name             = lower("${var.storage_account_name}${var.environment}")
  location         = var.sensor_rg_location
  vault_id         = var.backup_vault_id
  storage_account_id = var.storage_account_id
  backup_policy_id = azurerm_data_protection_backup_policy_blob_storage.app_storage_account_policy.id
}

resource "azurerm_data_protection_backup_policy_disk" "os_disk_backup_policy" {
  # depends_on = [ null_resource.delete_vm_backup_on_destroy ]
  provider = azurerm.management
  name     = var.vm_backup_vault_policy_name
  vault_id = var.backup_vault_id

  backup_repeating_time_intervals = ["R/2025-04-09T00:00:00+00:00/P1D"]

  default_retention_duration = "P30D"
}

resource "null_resource" "enable_vm_backup" {
   depends_on = [azurerm_role_assignment.backup_vault_os_disk_access, azurerm_role_assignment.backup_vault_rg_access, azurerm_data_protection_backup_policy_disk.os_disk_backup_policy ]

provisioner "local-exec" {
  interpreter = ["pwsh", "-Command"]
  command = <<EOT
    az login --service-principal -u "${var.ARM_CLIENT_ID}" -p "${var.ARM_CLIENT_SECRET}" --tenant "${var.ARM_TENANT_ID}"
 
    az account set --subscription ${var.management_subscription_id}
    az extension add --name dataprotection

    $dataSourceId = "${data.azurerm_managed_disk.vm_os_disk.id}"
    $vaultName = "${var.backup_vault_name}"
    $resourceGroup = "${var.soc_security_rg_name}"

    $existing = az dataprotection backup-instance list `
      -g $resourceGroup `
      --vault-name $vaultName `
      --query "[?properties.dataSourceInfo.resourceID=='$dataSourceId']" `
      --output json | ConvertFrom-Json

    if ($existing.Count -gt 0) {
      Write-Host "Backup instance already exists for $dataSourceId. Skipping creation."
      exit 0
    }

    pwd

    $tmpJson = "./backup_instance.json"
    Write-Host "Saving to $tmpJson"

    New-Item -Path . -Name "backup_instance.json" -ItemType File
    Write-Host "Current path file creation"


    New-Item -Path /tmp -Name "backup_instance.json" -ItemType File
    Write-Host "/tmp/ file creation"

    az dataprotection backup-instance initialize `
      --datasource-type AzureDisk `
      -l "${var.location}" `
      --policy-id "${azurerm_data_protection_backup_policy_disk.os_disk_backup_policy.id}" `
      --datasource-id $dataSourceId `
      --output json > $tmpJson

    Get-Content $tmpJson

    az dataprotection backup-instance create `
      -g $resourceGroup `
      --vault-name $vaultName `
      --backup-instance "@$tmpJson"
  EOT
}

  triggers = {
    always_run = "${timestamp()}"
  }
}

resource "null_resource" "delete_vm_backup_on_destroy" {
  triggers = {
    data_source_id  = data.azurerm_managed_disk.vm_os_disk.id
    vault_name      = var.backup_vault_name
    resource_group  = var.soc_security_rg_name
    subscription_id = var.management_subscription_id
  }

  lifecycle {
    ignore_changes = [triggers]
  }

  provisioner "local-exec" {
    when        = destroy
    interpreter = ["pwsh", "-Command"]
    command     = <<EOT
      $dataSourceId = "${self.triggers.data_source_id}"
      $vaultName = "${self.triggers.vault_name}"
      $resourceGroup = "${self.triggers.resource_group}"
      $subscriptionId = "${self.triggers.subscription_id}"

      az account set --subscription $subscriptionId
      az extension add --name dataprotection

      $backupInstance = az dataprotection backup-instance list `
        -g $resourceGroup `
        --vault-name $vaultName `
        --query "[?properties.dataSourceInfo.resourceID=='$dataSourceId']" `
        --output json | ConvertFrom-Json

      if ($backupInstance.Count -gt 0) {
        $name = $backupInstance[0].name
        Write-Host "Deleting backup instance: $name"
        az dataprotection backup-instance delete `
          --name $name `
          -g $resourceGroup `
          --vault-name $vaultName `
          --yes
      } else {
        Write-Host "No backup instance found to delete."
      }
    EOT
  }
}

