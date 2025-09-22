################################################
##                                            ##
##   Diagnostics Container for DEV VM         ##
##                                            ##
################################################

resource "azurerm_storage_container" "diagnostics_container" {
  name                  = lower("${var.diagonistic_container_name}-${var.environment}")
  storage_account_id    = azurerm_storage_account.azsawebootdiagapps.id
  container_access_type = var.diag_container_access_type
  provider              = azurerm.core
}

################################################
##                                            ##
##                 VM NIC                     ##
##                                            ##
################################################

resource "azurerm_network_interface" "shiny_app_nic" {
  name                = "${var.shinyapp_nic_name}-${var.environment}"
  location            = var.ch_rg_location
  resource_group_name = var.ch_rg_name

  ip_configuration {
    name                          = var.shiny_app_nic_ip_config_name
    subnet_id                     = var.az_snet_we_vm_sensor_id
    private_ip_address_allocation = var.shiny_app_nic_ip_config_allocation
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )

  provider = azurerm.core
}

################################################
##                                            ##
##          VM Windows Machine                ##
##                                            ##
################################################

resource "azurerm_windows_virtual_machine" "az-vm-we-sensor-dev" {
  name                  = "${var.shiny_vm_name}-${var.environment}"
  computer_name         = var.shiny_vm_computer_name
  admin_username        = var.shiny_vm_admin_username
  admin_password        = var.shiny_vm_admin_password
  location              = var.ch_rg_location
  resource_group_name   = var.ch_rg_name
  network_interface_ids = [azurerm_network_interface.shiny_app_nic.id]

  size = var.shiny_vm_size

  lifecycle {
    create_before_destroy = true
  }

  os_disk {
    name                 = "${var.shiny_vm_os_disk_name}-${var.environment}"
    caching              = var.shiny_vm_os_disk_caching
    storage_account_type = var.shiny_vm_os_disk_storage_account_type
  }

  source_image_reference {
    publisher = var.shiny_vm_publisher
    offer     = var.shiny_vm_offer
    sku       = var.shiny_vm_sku
    version   = var.shiny_vm_rg_version
  }


  boot_diagnostics {
    storage_account_uri = azurerm_storage_account.azsawebootdiagapps.primary_blob_endpoint
  }
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

################################################
##                                            ##
##             Workspace                      ##
##                                            ##
################################################

resource "azurerm_log_analytics_workspace" "workspace" {
  name                = "${var.workspace_name}-${var.environment}"
  location            = var.ch_rg_location
  resource_group_name = var.ch_rg_name
  sku                 = var.workspace_sku
  retention_in_days   = 30
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

################################################
##                                            ##
##     Diagnostics Container for Shiny VM     ##
##                                            ##
################################################

resource "azurerm_monitor_diagnostic_setting" "shinyapp_vm_diag" {
  name                       = "${var.shiny_vm_diag_name}-${var.environment}"
  target_resource_id         = azurerm_windows_virtual_machine.az-vm-we-sensor-dev.id
  storage_account_id         = azurerm_storage_account.azsawebootdiagapps.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
  # log {
  #   category = "BootDiagnostics"
  #   enabled  = true
  # }
  metric {
    category = var.shiny_vm_diag_metric_category
    enabled  = true
  }
  provider = azurerm.core
}


################################################
##                                            ##
##      Diagnostics Container for  VM         ##
##                                            ##
################################################

resource "azurerm_storage_container" "diag_container" {
  name                  = var.diag_container_name
  storage_account_id    = azurerm_storage_account.azsawebootdiagapps.id
  container_access_type = var.diag_container_access_type
  provider              = azurerm.core
}


resource "azurerm_virtual_machine_extension" "diagnostics_extension" {
  name                 = var.diag_extension_name
  virtual_machine_id   = azurerm_windows_virtual_machine.az-vm-we-sensor-dev.id
  publisher            = var.diag_extension_publisher
  type                 = var.diag_extension_type
  type_handler_version = var.diag_extension_type_version

  settings = jsonencode({
    StorageAccount = azurerm_storage_account.azsawebootdiagapps.name
    WadCfg = {
      DiagnosticMonitorConfiguration = {
        overallQuotaInMB = 5120
        DiagnosticInfrastructureLogs = {
          scheduledTransferLogLevelFilter = var.scheduledTransferLogLevelFilter
          scheduledTransferPeriod         = var.scheduledTransferPeriod
        }
        PerformanceCounters = {
          scheduledTransferPeriod = var.scheduledTransferPeriod
          PerformanceCounterConfiguration = [
            {
              counterSpecifier = "\\Processor Information(_Total)\\% Processor Time"
              unit             = var.diag_extension_unit
              sampleRate       = var.diag_extension_sampleRate
            }
          ]
        }
        WindowsEventLog = {
          scheduledTransferPeriod = var.scheduledTransferPeriod
          DataSource = [
            {
              name = var.DataSource_name
            }
          ]
        }
        Directories = {
          scheduledTransferPeriod = var.scheduledTransferPeriod
          FailedRequestLogs = {
            containerName      = var.Directories_containerName
            directoryQuotaInMB = 5120
          }
          CrashDumps = {
            containerName      = var.CrashDumps_containerName
            directoryQuotaInMB = 5120
            ProcessMonitoringConfiguration = [
              {
                processName = var.CrashDumps_processName
              }
            ]
          }
        }
      }
    }
  })

  protected_settings = jsonencode({
    storageAccountName     = azurerm_storage_account.azsawebootdiagapps.name
    storageAccountEndPoint = azurerm_storage_account.azsawebootdiagapps.primary_blob_endpoint
  })

  depends_on = [
    azurerm_windows_virtual_machine.az-vm-we-sensor-dev
  ]
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core

}


################################################
##                                            ##
##   Storage Account for BootDiagnostics      ##
##                                            ##
################################################

resource "azurerm_storage_account" "azsawebootdiagapps" {
  name                     = lower("${var.diagnostic_storage_account_name}${var.environment}")
  resource_group_name      = var.ch_rg_name
  location                 = var.ch_rg_location
  account_tier             = var.diagnostic_storage_account_tier
  account_replication_type = var.account_replication_type
  # Enable public access from all networks
  network_rules {
    default_action = var.default_action
  }
  # enable_https_traffic_only = true
  blob_properties {
    delete_retention_policy {
      days = 7
    }
  }
  min_tls_version = var.min_tls_version
  tags = merge(
    var.tags,
    {
      environment = var.environment
    }
  )
  provider = azurerm.core
}

terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      configuration_aliases = [
        azurerm.core
      ]
    }
  }
}