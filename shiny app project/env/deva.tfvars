######################## Environment Configuration ###########################

environment          = "DEVA"
app_subscription_id  = "56b7a70b-b102-4463-900e-527acc2f3ba5"
core_subscription_id = "781a4488-509c-46f6-81e9-23d7b6e220e6"
kcri_subscription_id = "0d85ba6e-ff02-47bf-ae1d-3704acbb3a47"
management_subscription_id = "54e40e11-f09e-481d-a80d-22eb8ad32ee6"
connectivity_subscription_id = "42972dc3-a430-4050-8162-b2e7937bc192"
tags = {
    created_by = "DigyCorp"
}

######################## Resource Group ######################################

resource_group_name_core   = "AZ_RG_WE_CORE"
resource_group_name_sensor = "AZ_RG_WE_SENSOR"
resource_group_name_kcri   = "AZ_RG_WE_CORE"
rg_name_gitlab = "AZ_RG_WE_GITLAB"

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


loganalytics_workspace_name = "AZ-LAW-WE-KCRI-LOGS"