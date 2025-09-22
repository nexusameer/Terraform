######################## Environment Configuration ###########################

environment          = "PRD"
app_subscription_id  = "TBA"
core_subscription_id = "TBA"
kcri_subscription_id = "TBA"
management_subscription_id = "TBA"
connectivity_subscription_id = "TBA"
tags = {
    created_by = "DigyCorp"
}

######################## Resource Group ######################################

resource_group_name_core   = "AZ_RG_WE_CORE"
resource_group_name_sensor = "AZ_RG_WE_SENSOR"
resource_group_name_kcri   = "AZ_RG_WE_CORE"
resource_group_name_gitlab = "AZ_RG_WE_DNS"

################################ vnet #######################################

az_vnet_we_sensor_dashboard = "AZ_VNET_WE_SHINYAPP"


################################# Subnet #######################################

az_snet_we_webapp_sensor = "AZ_SNET_WE_WEBAPP_SHINYAPP"
az_snet_we_pe_sensor     = "AZ_SNET_WE_PE_SHINYAPP"
az_snet_we_vm_sensor     = "AZ_SNET_WE_VM_SHINYAPP"


################################# Private DNS #######################################

acr_private_dns_name         = "privatelink.azurecr.io"
private_dns_zone_name_webapp = "privatelink.azurewebsites.net"
dns_record_azcrweapp         = "azcrweapp"
dns_record_westeurope_data   = "westeurope.data"


################################ Shiny vm ############################################

shiny_vm_name                         = "AZ-VM-WE-SENSOR"
shinyapp_nic_name                     = "AZ-NIC-WE-SENSOR"
shiny_vm_admin_username               = "azureuser"
shiny_vm_admin_password               = "P@ssw0rd9242"
shiny_vm_size                         = "Standard_D4as_v4"
shiny_vm_os_disk_storage_account_type = "Premium_LRS"
diagnostic_storage_account_name       = "azsawebootdiagapp"
diagnostic_storage_account_tier       = "Standard"
vm_backup_vault_name                  = "az-vm-we-sensor-backup-vault"
azsawebootdiagapps_backup_vault_name = "azsawebootdiagapps-backup-vault"
azsawebootdiagapps_backup_vault_policy_name = "azsawebootdiagapps-recovery-vault-policy"

################################ App service ##################################################

app_service_name    = "AZ-APSRV-WE-SENSOR"
sensor_app_service_plan_name = "AZ-ASP-PREM-WE-APPS"
az-kv-we-core       = "AZ-KV-WE-CORE"


################################ Control Panel App service ####################################

control_panel_app_service_name    = "AZ-APSRV-WE-CP-SENSOR"

################################ App container registry #######################################

sensor_container_registry_name = "AZCRWEAPP"
az_pe_we_apps_to_cr_we_core = "AZ_PE_WE_APPS_TO_CR_WE_APPS"

################################ Action group #######################################

action_group_name ="notification_critical_events"
dashboard_name = "shiny_app_dashboard"
vm_backup_vault_policy_name = "vm-policy"
soc_security_rg_name = "AZ-RG-WE-SOC-SECURITY"



backup_vault_name = "BackupVault"
backup_vault_policy_name = "app-storage-account-policy"