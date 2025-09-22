# ################################################
# ##                                            ##
# ##   Diagnostics Container for BASTION         ##
# ##                                            ##
# ################################################

# resource "azurerm_storage_container" "diagnostics_container" {
#   name                  = lower("${var.diagonistic_container_name}-${var.environment}")
#   storage_account_id    = azurerm_storage_account.azsawebootdiagapps.id
#   container_access_type = var.diag_container_access_type
# }

# ################################################
# ##                                            ##
# ##                 BASTION NIC                     ##
# ##                                            ##
# ################################################

# resource "azurerm_network_interface" "bastion_nic" {
#   name                = "${var.bastion_nic_name}-${var.environment}"
#   location            = var.ch_rg_location
#   resource_group_name = var.ch_rg_name

#   ip_configuration {
#     name                          = var.bastion_nic_ip_config_name
#     subnet_id                     = var.az_snet_we_bastion_ch_id
#     private_ip_address_allocation = var.bastion_nic_ip_config_allocation
#     public_ip_address_id          = azurerm_public_ip.bastion_pip.id
#   }
#   lifecycle {
#     create_before_destroy = true
#   }
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
# }

# ################################################
# ##                                            ##
# ##          BASTION Windows Machine           ##
# ##                                            ##
# ################################################

# resource "azurerm_windows_virtual_machine" "az-bastion-we-ch" {
#   name                  = "${var.bastion_name}-${var.environment}"
#   computer_name         = var.bastion_computer_name
#   admin_username        = var.bastion_admin_username
#   admin_password        = var.bastion_admin_password
#   location              = var.ch_rg_location
#   resource_group_name   = var.ch_rg_name
#   vm_agent_platform_updates_enabled = true
#   network_interface_ids = [azurerm_network_interface.bastion_nic.id]

#   size = var.bastion_size

#   lifecycle {
#     create_before_destroy = true
#   }

#   os_disk {
#     name                 = "${var.bastion_os_disk_name}-${var.environment}"
#     caching              = var.bastion_os_disk_caching
#     storage_account_type = var.bastion_os_disk_storage_account_type
#   }

#   source_image_reference {
#     publisher = var.bastion_publisher
#     offer     = var.bastion_offer
#     sku       = var.bastion_sku
#     version   = var.bastion_rg_version
#   }


#   boot_diagnostics {
#     storage_account_uri = azurerm_storage_account.azsawebootdiagapps.primary_blob_endpoint
#   }
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
# }



# ################################################
# ##                                            ##
# ##     Diagnostics Container for BASTION      ##
# ##                                            ##
# ################################################

# resource "azurerm_monitor_diagnostic_setting" "bastion_diag" {
#   name                       = "${var.bastion_diag_name}-${var.environment}"
#   target_resource_id         = azurerm_windows_virtual_machine.az-bastion-we-ch.id
#   storage_account_id         = azurerm_storage_account.azsawebootdiagapps.id
#   log_analytics_workspace_id = azurerm_log_analytics_workspace.workspace.id
#   # log {
#   #   category = "BootDiagnostics"
#   #   enabled  = true
#   # }
#   metric {
#     category = var.bastion_diag_metric_category
#     enabled  = true
#   }
# }


# ################################################
# ##                                            ##
# ##      Diagnostics Container for  BASTION    ##
# ##                                            ##
# ################################################

# resource "azurerm_storage_container" "diag_container" {
#   name                  = var.diag_container_name
#   storage_account_id    = azurerm_storage_account.azsawebootdiagapps.id
#   container_access_type = var.diag_container_access_type
# }


# resource "azurerm_virtual_machine_extension" "diagnostics_extension" {
#   name                 = var.diag_extension_name
#   virtual_machine_id   = azurerm_windows_virtual_machine.az-bastion-we-ch.id
#   publisher            = var.diag_extension_publisher
#   type                 = var.diag_extension_type
#   type_handler_version = var.diag_extension_type_version

#   settings = jsonencode({
#     StorageAccount = azurerm_storage_account.azsawebootdiagapps.name
#     WadCfg = {
#       DiagnosticMonitorConfiguration = {
#         overallQuotaInMB = 5120
#         DiagnosticInfrastructureLogs = {
#           scheduledTransferLogLevelFilter = var.scheduledTransferLogLevelFilter
#           scheduledTransferPeriod         = var.scheduledTransferPeriod
#         }
#         PerformanceCounters = {
#           scheduledTransferPeriod = var.scheduledTransferPeriod
#           PerformanceCounterConfiguration = [
#             {
#               counterSpecifier = "\\Processor Information(_Total)\\% Processor Time"
#               unit             = var.diag_extension_unit
#               sampleRate       = var.diag_extension_sampleRate
#             }
#           ]
#         }
#         WindowsEventLog = {
#           scheduledTransferPeriod = var.scheduledTransferPeriod
#           DataSource = [
#             {
#               name = var.DataSource_name
#             }
#           ]
#         }
#         Directories = {
#           scheduledTransferPeriod = var.scheduledTransferPeriod
#           FailedRequestLogs = {
#             containerName      = var.Directories_containerName
#             directoryQuotaInMB = 5120
#           }
#           CrashDumps = {
#             containerName      = var.CrashDumps_containerName
#             directoryQuotaInMB = 5120
#             ProcessMonitoringConfiguration = [
#               {
#                 processName = var.CrashDumps_processName
#               }
#             ]
#           }
#         }
#       }
#     }
#   })

#   protected_settings = jsonencode({
#     storageAccountName     = azurerm_storage_account.azsawebootdiagapps.name
#     storageAccountEndPoint = azurerm_storage_account.azsawebootdiagapps.primary_blob_endpoint
#   })

#   depends_on = [
#     azurerm_windows_virtual_machine.az-bastion-we-ch
#   ]
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
# }


# ################################################
# ##                                            ##
# ##   Storage Account for BootDiagnostics      ##
# ##                                            ##
# ################################################

# resource "azurerm_storage_account" "azsawebootdiagapps" {
#   name                     = lower("${var.diagnostic_storage_account_name}${var.environment}")
#   resource_group_name      = var.ch_rg_name
#   location                 = var.ch_rg_location
#   account_tier             = var.diagnostic_storage_account_tier
#   account_replication_type = var.account_replication_type
#   # Enable public access from all networks
#   network_rules {
#     default_action = var.default_action
#   }
#   # enable_https_traffic_only = true
#   blob_properties {
#     delete_retention_policy {
#       days = 7
#     }
#   }
#   min_tls_version = var.min_tls_version
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
# }

# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       configuration_aliases = [
#         azurerm.apps    
#       ]
#     }
#   }
# }

# ################################################
# ##                                            ##
# ##              Bastion Public IP             ##
# ##                                            ##
# ################################################

# resource "azurerm_public_ip" "bastion_pip" {
#   name                = lower("ch-bastion-public-ip-${var.environment}")
#   location            = var.ch_rg_location
#   resource_group_name = var.ch_rg_name
#   allocation_method   = "Static"
#   sku                = "Standard"
# }

# ################################################
# ##                                            ##
# ##              Bastion NSG                   ##
# ##                                            ##
# ################################################


# resource "azurerm_network_security_group" "nsg" {
#   name                = lower("ch-bastion-nsg-${var.environment}")
#   location            = var.ch_rg_location
#   resource_group_name = var.ch_rg_name
#   tags = merge (
#     var.tags,
#     {
#     environment = var.environment 
#     }
#   )
# }

# resource "azurerm_network_security_rule" "rule" {
#   name                        = "RDP"
#   priority                    = 100
#   direction                   = "Inbound"
#   access                      = "Allow"
#   protocol                    = "Tcp"
#   source_port_range           = "*"
#   destination_port_range      = "3389"
#   source_address_prefix       = "*"
#   destination_address_prefix  = "*"
#   resource_group_name         = var.ch_rg_name
#   network_security_group_name = azurerm_network_security_group.nsg.name
# }

# resource "azurerm_subnet_network_security_group_association" "nsg-assoc" {
#   subnet_id                 = var.az_snet_we_bastion_ch_id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

# resource "azurerm_network_interface_security_group_association" "nsg-nic-assoc" {
#   network_interface_id      = azurerm_network_interface.bastion_nic.id
#   network_security_group_id = azurerm_network_security_group.nsg.id
# }

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
}