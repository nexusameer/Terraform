######################## Environment Configuration ###########################

environment                  = "DEVB"
core_subscription_id         = "c2b385d9-375f-4f8e-8306-5cbe6260bc74"
app_subscription_id          = "09032e05-53fb-43cd-a0ba-99e44e76af15"
management_subscription_id   = "54e40e11-f09e-481d-a80d-22eb8ad32ee6"
kcri_subscription_id         = "0af3c296-65df-4a85-903b-62a9cdaeac16"
connectivity_subscription_id = "42972dc3-a430-4050-8162-b2e7937bc192"
tags = {
  created_by = "DigyCorp"
}


######################## Resource Group ######################################

resource_group_name            = "AZ_RG_WE_CORE"
kvap_rg_name                   = "AZ_RG_WE_KVAP"
sensor_resource_group_name     = "AZ_RG_WE_SENSOR"
resource_group_ch_name         = "AZ_RG_WE_CH"
gitlab_resource_group_name     = "AZ_RG_WE_GITLAB"
dns_rg_name                    = "AZ_RG_WE_DNS"
resource_group_location        = "West Europe"
sensor_resource_group_location = "West Europe"
kvap_rg_location               = "West Europe" #WORK
kcri_resource_group_name       = "AZ_RG_WE_CORE"
soc_security_rg_name           = "AZ-RG-WE-SOC-SECURITY"
security_rg_location           = "West Europe"
az_law_we_security_logs        = "AZ-LAW-WE-KCRI-LOGS"

################################ vnet #######################################

vnet_name        = "AZ_VNET_WE_CORE"
sensor_vnet_name = "AZ_VNET_WE_SHINYAPP"
vnet_ch_name     = "AZ_VNET_WE_CH"
kvap_vnet_name   = "AZ_VNET_WE_KVAP"
gitlab_vnet_name = "AZ_VNET_WE_GITLAB"

vnet_address_space        = ["10.253.14.0/23", "10.253.16.0/24"]
sensor_vnet_address_space = ["10.253.17.0/26"]
vnet_ch_address_space     = ["10.253.18.0/24"]
kvap_address_space        = ["10.253.17.64/26"]

################################# Subnet #######################################

sensor_db_subnet_name            = "AZ_SNET_WE_DB_SENSOR"
sensor_pe_subnet_name            = "AZ_SNET_WE_PE_SENSOR"
sensor_batch_account_subnet_name = "AZ_SNET_WE_BA_SENSOR"
sensor_functionapp_subnet_name   = "AZ_SNET_WE_FA_SENSOR"
sensor_bastion_subnet_name       = "AzureBastionSubnet"
# db_ch_subnet_name            = "AZ_SNET_WE_DB_CH"


sensor_pe_address_prefix            = ["10.253.14.192/27"]
sensor_batch_account_address_prefix = ["10.253.14.224/28"]
sensor_db_address_prefix            = ["10.253.14.240/28"]
sensor_functionapp_address_prefix   = ["10.253.15.0/28"]
sensor_bastion_address_prefix       = ["10.253.16.128/26"]
# database_ch_address_prefix      = ["10.253.2.144/28"]



private_endpoint_sensor_subnet_name = "AZ_SNET_WE_PE_SHINYAPP"
webapp_sensor_subnet_name           = "AZ_SNET_WE_WEBAPP_SHINYAPP"
virtual_machine_sensor_subnet_name  = "AZ_SNET_WE_VM_SHINYAPP"

webapp_sensor_address_prefix           = ["10.253.17.0/28"]
private_endpoint_sensor_address_prefix = ["10.253.17.16/28"]
virtual_machine_sensor_address_prefix  = ["10.253.17.32/28"]

# private_endpoint_kvap_subnet_name = "AZ_SNET_WE_PE_KVAP"
# vm_gpu_kvap_subnet_name           = "AZ_SNET_WE_GPU_VM_KVAP"
# vm_cpu_kvap_subnet_name           = "AZ_SNET_WE_CPU_VM_KVAP"

# private_endpoint_kvap_subnet_prefix = ["10.253.4.64/28"]
# vm_gpu_kvap_subnet_prefix           = ["10.253.4.80/28"]
# vm_cpu_kvap_subnet_prefix           = ["10.253.4.96/28"]
ch_appgtw_subnet_name           = "AZ_SNET_WE_APPGW"
aks_ch_subnet_name              = "AZ_SNET_WE_AKS_CH"
private_endpoint_ch_subnet_name = "AZ_SNET_WE_PE_CH"
# function_app_ch_subnet_name     = "AZ_SNET_WE_FAP_CH"
# machine_learning_ch_subnet_name = "AZ_SNET_WE_ML_CH"
# virtual_machine_ch_subnet_name  = "AZ_SNET_WE_VM_CH"
ch_db_subnet_name = "AZ_SNET_WE_DB"

aks_ch_address_prefix    = ["10.253.18.0/25"]
ch_db_address_prefix     = ["10.253.18.128/28"]
ch_pe_address_prefix     = ["10.253.18.144/28"]
ch_appgtw_address_prefix = ["10.253.18.160/27"]
# function_app_ch_address_prefix     = ["10.253.4.176/28"]
# machine_learning_ch_address_prefix = ["10.253.4.192/27"]
# virtual_machine_ch_address_prefix  = ["10.253.4.224/28"]

pe_d_bricks_metastore_subnet_name          = "AZ_SNET_WE_DBRICK_MS"
d_bricks_container_subnet_name             = "AZ_SNET_WE_DBRICK_CONTAINER"
pe_d_bricks_cp_subnet_name                 = "AZ_SNET_WE_PE_DBRICK_CP"
pe_d_bricks_managed_storage_subnet_name    = "AZ_SNET_WE_DBRICK_STG"
d_bricks_host_subnet_name                  = "AZ_SNET_WE_DBRICK_HOST"
d_bricks_container_address_prefix          = ["10.253.14.0/26"]
d_bricks_host_address_prefix               = ["10.253.14.64/26"]
pe_d_bricks_cp_address_prefix              = ["10.253.14.128/28"]
pe_d_bricks_managed_storage_address_prefix = ["10.253.14.144/28"]




ml_batch_account_subnet_name     = "AZ_SNET_WE_BA_ML"
ml_function_app_subnet_name      = "AZ_SNET_WE_FA_ML"
ml_pe_subnet_name                = "AZ_SNET_WE_PE_ML"
lss_batch_account_subnet_name    = "AZ_SNET_WE_BA_LSS"
lss_function_app_subnet_name     = "AZ_SNET_WE_FA_LSS"
lss_pe_subnet_name               = "AZ_SNET_WE_PE_LSS"
inv_db_subnet_name               = "AZ_SNET_WE_DB_INV"
inv_vm_subnet_name               = "AZ_SNET_WE_VM_INV"
inv_function_app_subnet_name     = "AZ_SNET_WE_FA_INV"
inv_pe_subnet_name               = "AZ_SNET_WE_PE_INV"
event_hub_pe_subnet_name         = "AZ_SNET_WE_PE_EH"
ml_batch_account_address_prefix  = ["10.253.15.48/28"]
ml_function_app_address_prefix   = ["10.253.15.64/28"]
ml_pe_subnet_address_prefix      = ["10.253.15.80/28"]
lss_batch_account_address_prefix = ["10.253.15.128/28"]
lss_function_app_address_prefix  = ["10.253.15.144/28"]
lss_pe_address_prefix            = ["10.253.15.160/28"]
inv_db_address_prefix            = ["10.253.15.208/28"]
inv_function_app_address_prefix  = ["10.253.15.224/28"]
inv_pe_address_prefix            = ["10.253.15.240/28"]
inv_vm_address_prefix            = ["10.253.16.0/28"]
event_hub_address_prefix         = ["10.253.16.48/28"]


kvap_vm_subnet_name    = "AZ_SNET_WE_VM"
kvap_vm_address_prefix = ["10.253.17.64/28"]

ch_pe_subnet_name = "AZ_SNET_WE_PE_CH"






######################################################## APP Private DNS ##################################################

acr_sensor_private_dns_name = "privatelink.azurecr.io"
acr_sensor_link_name        = "sensor-vnet-link-to-acr-apps"
sensor_appservice_dns_name  = "privatelink.azurewebsites.net"
sensor_appservice_link_name = "sensor-vnet-link-to-appservice"
sensor_link_name            = "sensor-vnet-link-to-apps-core"
# app_batch_link_name         = "sensor-vnet-link-to-batch"
sensor_psql_dns_vnet_name = "sensor-vnet-link-to-psql"



###################################### Core privet DNS #########################################

core_batch_private_dns_name = "privatelink.batch.azure.com"
core_batch_link_name        = "core-vnet-link-to-batch"
core_acr_private_dns_name   = "privatelink.azurecr.io"
core_acr_link_name          = "core-vnet-link-to-acr"
core_fap_private_dns_name   = "privatelink.azurewebsites.net"
core_network_name           = "core-vnet-link"
core_file_dns_name          = "privatelink.file.core.windows.net"
core_file_link_name         = "privatelink.file.core.windows.net-link"
core_fap_dns_name           = "privatelink.blob.core.windows.net"
core_table_fap_dns_name     = "privatelink.table.core.windows.net"
core_queue_fap_dns_name     = "privatelink.queue.core.windows.net"
core_table_link_name        = "privatelink.table.core.windows.net-link"
core_table_record_name      = "azsawefappcore"
core_queue_link_name        = "privatelink.queue.core.windows.net-link"
core_queue_record_name      = "azsawefappcore"
core_blob_link_name         = "privatelink.blob.core.windows.net-link"
core_vault_name             = "privatelink.vaultcore.azure.net"
core_link_name              = "core-vnet-link-to-keyvault"
core_psql_dns_name          = "privatelink.postgres.database.azure.com"
core_psql_dns_vnet_name     = "core-vnet-link-to-psql"
eventhub_private_dns_name   = "privatelink.servicebus.windows.net"
ch_link_name                = "ch-vnet-link-to-eventhub"
eventhub_link_name          = "core-vnet-link-to-eventhub"

############################ Core Route Table #################################

core_route_table_name     = "AZ_RT_WE_DEFAULT_CORE"
core_route                = "Default-Route"
core_route_address_prefix = "0.0.0.0/0"
core_next_hop_type        = "VirtualAppliance"
core_next_hop_ip_address  = "10.255.224.78"


############################ App Route Table #################################

app_route_table_name     = "AZ_RT_WE_DEFAULT_APPS"
app_route                = "Default-Route"
app_route_address_prefix = "0.0.0.0/0"
app_next_hop_type        = "VirtualAppliance"
app_next_hop_ip_address  = "10.255.224.78"

############################ CH Route Table ##################################

ch_route_table_name     = "AZ_RT_WE_DEFAULT_CH"
ch_route                = "Default-Route"
ch_route_address_prefix = "0.0.0.0/0"
ch_next_hop_type        = "VirtualAppliance"
ch_next_hop_ip_address  = "10.255.224.78"
ch_internet_route_table_name     = "AZ_RT_WE_DEFAULT_CH_INTERNET"
ch_internet_route                = "Default-Route"
ch_internet_route_address_prefix = "0.0.0.0/0"
ch_internet_next_hop_type    = "Internet"


############################ Vpc Peering #################################

vnet_peering_sensor_name = "AZ_VNET_WE_SHINYAPP"
vnet_peering_core_name   = "AZ_VNET_WE_CORE"
vnet_peering_gitlab_name = "AZ_VNET_WE_GITLAB"
vnet_peering_kvap_name   = "AZ_VNET_WE_KVAP"
vnet_peering_ch_name     = "AZ_VNET_WE_CH"


############################ Gitlab #################################

gitlab_acr_link_name      = "gitlab-vnet-link-to-acr"
gitlab_psql_dns_vnet_name = "gitlab-vnet-link-to-psql"
gitlab_batch_link_name    = "gitlab-vnet-link-to-batch"



############################ Action Group #################################
recipient = "dcdevenv.notifications@digycorp.com"

################################# Private DNS #######################################
aks_private_dns_zone_name      = "privatelink.westeurope.azmk8s.io"
acr_private_dns_name           = "privatelink.azurecr.io"
file_private_dns_zone_name     = "privatelink.file.core.windows.net"
blob_private_dns_zone_name     = "privatelink.blob.core.windows.net"
queue_private_dns_zone_name    = "privatelink.queue.core.windows.net"
table_private_dns_zone_name    = "privatelink.table.core.windows.net"
fap_private_dns_zone_name      = "privatelink.azurewebsites.net"
batch_private_dns_zone_name    = "privatelink.batch.azure.com"
keyvault_private_dns_zone_name = "privatelink.vaultcore.azure.net"
psql_private_dns_zone_name     = "privatelink.postgres.database.azure.com"
sensor_blob_link_name          = "sensor-vnet-link-to-blob"
aks_link_name_core             = "core-vnet-link-to-aks"
aks_link_name_ch               = "ch-vnet-link-to-aks"
psql_link_name                 = "ch-vnet-link-to-psql"
acr_link_name                  = "ch-vnet-link-to-acr"
blob_link_name                 = "ch-vnet-link-to-blob"
################################# Private DNS Link #######################################
# core_link_name = "core-vnet-link"

################################# Backup Vault #######################################

backup_vault_name = "BackupVault"

connectivity_vnet_name = "AZ_VNET_WE_CONNECTIVITY"
connectivity_rg_name = "AZ_RG_WE_CONNECTIVITY"

vpop_collection_rule_name    = "vPop-Network-Collection-Rule"
core_to_vpop_rule_name       = "core-to-vPop-rule"
vpop_address_space           = ["10.0.0.0/8"]
vpop_to_core_rule_name       = "vPop-to-core-rule"
ch_to_vpop_rule_name         = "ch-to-vPop-rule"
vpop_to_ch_rule_name         = "vPop-to-ch-rule"
vpop_to_kvap_rule_name       = "vPop-to-kvap-rule"
kvap_to_vpop_rule_name       = "kvap-to-vPop-rule"
sensor_to_vpop_rule_name     = "sensor-to-vPop-rule"
vpop_to_sensor_rule_name     = "vPop-to-sensor-rule"
gitlab_to_vpop_rule_name     = "gitlab-to-vPop-rule"
vpop_to_gitlab_rule_name     = "vPop-to-gitlab-rule"
sensor_to_internet_rule_name = "sensor-to-internet-rule"
gitlab_to_internet_rule_name = "gitlab-to-internet-rule"
kvap_to_gitlab_rule_name     = "kvap-to-gitlab-rule"
gitlab_to_kvap_rule_name     = "gitlab-to-kvap-rule"
ch_to_gitlab_rule_name       = "ch-to-gitlab-rule"
gitlab_to_ch_rule_name       = "gitlab-to-ch-rule"
sensor_to_gitlab_rule_name   = "sensor-to-gitlab-rule"
gitlab_to_sensor_rule_name   = "gitlab-to-sensor-rule"
core_to_gitlab_rule_name     = "core-to-gitlab-rule"
gitlab_to_core_rule_name     = "gitlab-to-core-rule"

sensor_to_core_rule_name     = "sensor-to-core-rule"
core_to_sensor_rule_name     = "core-to-sensor-rule"
kvap_to_core_rule_name       = "kvap-to-core-rule"
core_to_kvap_rule_name       = "core-to-kvap-rule"
ch_to_core_rule_name         = "ch-to-core-rule"
firewall_name        = "AZ_FW_WE_CONNECTIVITY"
firewall_policy_name = "AZ_FW_POLICY_WE_CONNECTIVITY"
core_to_ch_rule_name         = "core-to-ch-rule"
fw_policy_rule_cg_name       = "DefaultNetworkRuleCollectionGroup"
management_collection_rule_name = "Management-Network-Collection-Rule"
network_collection_rule_name = "Network-Collection-Rule"

function_app_sensor_to_internet_rule_name = "function-app-sensor-to-internet-rule"
batch_account_sensor_to_internet_rule_name = "batch-account-sensor-to-internet-rule"
function_app_ml_to_internet_rule_name = "function-app-ml-to-internet-rule"
batch_account_ml_to_internet_rule_name = "batch-account-ml-to-internet-rule"
batch_account_lss_to_internet_rule_name = "batch-account-lss-to-internet-rule"
function_app_lss_to_internet_rule_name = "function-app-lss-to-internet-rule"
function_app_inv_to_internet_rule_name = "function-app-inv-to-internet-rule"