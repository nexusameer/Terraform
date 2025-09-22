
######################## Environment Configuration ###########################
environment                  = "DEVA"
core_subscription_id         = "781a4488-509c-46f6-81e9-23d7b6e220e6"
apps_subscription_id         = "56b7a70b-b102-4463-900e-527acc2f3ba5"
tre_subscription_id          = "0d85ba6e-ff02-47bf-ae1d-3704acbb3a47"
connectivity_subscription_id = "42972dc3-a430-4050-8162-b2e7937bc192"
management_subscription_id   = "54e40e11-f09e-481d-a80d-22eb8ad32ee6"
agic_private_ip_address      = "10.253.10.164"
# agic_private_ip_address      = "10.253.0.196"


######################## Need to be update ###########################
created_by                 = "DigyCorp"
eventhub_namespace_name    = "ch-eventhub-namespace"
eventhub_name              = "ch-eventhub"
eventhub_partition_count   = 2
eventhub_message_retention = 1
eventhub_consumer_groups   = ["cg1", "cg2"]
admin_principal_name       = "my-app"
core_rg                    = "AZ_RG_WE_CORE"
dns_rg_name                = "AZ_RG_WE_DNS"
# az_vnet_we_sensor_dashboard = "AZ_VNET_WE_SENSOR_DASHBOARD"
######################## Need to be update ###########################



######################## Need to be verify by KASHIF ###########################

# resource_group_name     = "CH"
location                = "West Europe"
aks_cluster_name        = "az_aks_we_ch"
dns_prefix              = "ch-cluster"
appgw_name              = "AZ_APPGW_WE_CH"
agic_identity_name      = "AZ_APPGW_WE_IDENTITY"
private_cluster_enabled = true
aks_node_count          = 1
aks_node_size           = "Standard_D4s_v3" # This is only available in AZ 3
default_node_pool_name  = "default"
node_os_disk_size       = 30

node_pool_name                  = "chnodepool"
vm_size                         = "Standard_E4as_v6" ## High Memory
node_count                      = 2
auto_scaling_enabled            = true
node_min_count                  = 2
node_max_count                  = 50
aks_sku_tier                    = "Standard"
cost_analysis_enabled           = true
kubernetes_version              = "1.32.5"
automatic_upgrade_channel       = "patch"
availability_zones              = null
min_count                       = 1
max_count                       = 2
drain_timeout_in_minutes        = 0
max_surge                       = "10%"
node_soak_duration_in_minutes   = 0
aks_private_dns_name            = "privatelink.westeurope.azmk8s.io"
gitlab_rg_name                  = "AZ_RG_WE_DNS"
keda_enabled                    = true
vertical_pod_autoscaler_enabled = true
aks_private_dns_zone_name       = "privatelink.westeurope.azmk8s.io"
######################## Need to be verify by KASHIF ###########################








core_vnet = "AZ_VNET_WE_CORE"
# core_db_subnet_name = "AZ_SNET_WE_DB_CH"
core_pe_subnet_name = "AZ_SNET_WE_PE_INV"
ch_db_subnet_name   = "AZ_SNET_WE_DB"
tags = {
  created_by = "DigyCorp"
}
psql_private_dns_zone_name = "privatelink.postgres.database.azure.com"

gitlab_rg = "AZ_RG_WE_GITLAB"


########### ACR ###################################

acr_name        = "azcrwedpch"
connection_name = "AZ_PE_WE_CH_TO_CR_WE_DP_CH"

################################ App service ##################################################

az-kv-we-core = "AZ-KV-WE-CORE"

######################## Resource Group ######################################

resource_group_name_core         = "AZ_RG_WE_CORE"
resource_group_name_sensor       = "AZ_RG_WE_SENSOR"
resource_group_name_kcri         = "AZ_RG_WE_CORE"
resource_group_name_gitlab       = "AZ_RG_WE_GITLAB"
resource_group_name_ch           = "AZ_RG_WE_CH"
resource_group_name_connectivity = "AZ_RG_WE_CONNECTIVITY"

################################ vnet #######################################


az_vnet_we_ch           = "AZ_VNET_WE_CH"
az_vnet_we_connectivity = "AZ_VNET_WE_CONNECTIVITY"
gitlab_vnet_name        = "AZ_VNET_WE_GITLAB"

################################# Subnet #######################################

az_snet_we_webapp_sensor     = "AZ_SNET_WE_WEBAPP_SENSOR"
az_snet_we_pe_sensor         = "AZ_SNET_WE_PE_SENSOR"
az_snet_we_vm_sensor         = "AZ_SNET_WE_VM_SENSOR"
az_snet_we_aks_ch            = "AZ_SNET_WE_AKS_CH"
az_snet_we_agic_ch           = "AZ_SNET_WE_APPGW"
az_snet_we_agic_connectivity = "AZ_SNET_WE_APPGW"
az_snet_we_vm_inv            = "AZ_SNET_WE_VM_INV"

################################# Private DNS #######################################

acr_private_dns_name         = "privatelink.azurecr.io"
private_dns_zone_name_webapp = "privatelink.azurewebsites.net"
dns_record_azcrweapp         = "azcrweapp"
dns_record_westeurope_data   = "westeurope.data"
blob_private_dns_name        = "privatelink.blob.core.windows.net"
file_private_dns_name        = "privatelink.file.core.windows.net"
table_private_dns_name       = "privatelink.table.core.windows.net"
queue_private_dns_name       = "privatelink.queue.core.windows.net"

################################ Action group #######################################

action_group_name = "notification_critical_events"
# dashboard_name = "shiny_app_dashboard"

################################ Container Registry #################################

container_registry_name = "azcrwedpcore"

################################ Eventhub ##################################################

eventhub_namespace_core       = "az-eh-we-core"
eventhub_namespace_ch         = "az-eh-we-ch"
eventhub_namespace_aks        = "az-aks-we-ch"
eventhub_namespace_k8         = "az-k8-we-ch"
sku                           = "Standard"
ml_topic_name                 = "mltopic"
wq_topic_name                 = "DN_WQ"
lss_topic_name                = "DN_LSS"
idb_topic_name                = "DN_IDB"
lss_hist_service_plan_name    = "AZ-ASP-PREM-WE-LSS-HIST-CORE"
ml_hist_service_plan_name     = "AZ-ASP-PREM-WE-ML-HIST-CORE"
lss_service_plan_name         = "AZ-ASP-PREM-WE-LSS-CORE"
inv_service_plan_name         = "AZ-ASP-PREM-WE-INV-CORE"
ml_service_plan_name          = "AZ-ASP-PREM-WE-ML-CORE"
lss_function_app_name         = "AZ-FAP-WE-LSS-CORE"
ml_function_app_name          = "AZ-FAP-WE-ML-CORE"
crs_function_app_name         = "AZ-FAP-WE-CRS-CORE"
inv_lss_function_app_name     = "AZ-FAP-WE-INV-LSS-CORE"
inv_ml_function_app_name      = "AZ-FAP-WE-INV-ML-CORE"
wq_function_app_name          = "AZ-FAP-WE-ML-CORE"
inv_wq_function_app_name      = "AZ-FAP-WE-INV-WQ-CORE"
lss_hist_function_app_name    = "AZ-FAP-WE-LSS-HIST-CORE"
ml_hist_function_app_name     = "AZ-FAP-WE-ML-HIST-CORE"
inv_wq_function_app_pe_name   = "AZ_PE_WE_CORE_TO_INV_WQ_FAP_CORE"
lss_hist_function_app_pe_name = "AZ_PE_WE_CORE_TO_LSS_HIST_FAP_CORE"
ml_hist_function_app_pe_name  = "AZ_PE_WE_CORE_TO_ML_HIST_FAP_CORE"
inv_pe_name_file              = "AZ_PE_WE_CORE_TO_INV_STAG_FILE_CORE"
inv_pe_name_blob              = "AZ_PE_WE_CORE_TO_INV_STAG_BLOB_CORE"
inv_pe_name_queue             = "AZ_PE_WE_CORE_TO_INV_STAG_QUEUE_CORE"
inv_pe_name_table             = "AZ_PE_WE_CORE_TO_INV_STAG_TABLE_CORE"
lss_hist_pe_name_blob         = "AZ_PE_WE_CORE_TO_LSS_HIST_STAG_BLOB_CORE"
lss_hist_pe_name_file         = "AZ_PE_WE_CORE_TO_LSS_HIST_STAG_FILE_CORE"
lss_hist_pe_name_table        = "AZ_PE_WE_CORE_TO_LSS_HIST_STAG_TABLE_CORE"
lss_hist_pe_name_queue        = "AZ_PE_WE_CORE_TO_LSS_HIST_STAG_QUEUE_CORE"
ml_hist_pe_name_file          = "AZ_PE_WE_CORE_TO_ML_HIST_STAG_FILE_CORE"
ml_hist_pe_name_blob          = "AZ_PE_WE_CORE_TO_ML_HIST_STAG_BLOB_CORE"
ml_hist_pe_name_queue         = "AZ_PE_WE_CORE_TO_ML_HIST_STAG_QUEUE_CORE"
ml_hist_pe_name_table         = "AZ_PE_WE_CORE_TO_ML_HIST_STAG_TABLE_CORE"


################################ Storage account ##################################################



############################ Postgres ###############################
ch_db_name                          = "az-pstgre-we-ch-db"
inv_db_name                         = "az-pstgre-we-core-db"
az_pstgre_we_sensor_db_core         = "az-pstgre-we-dn-db"
az_pstgre_we_sensor_db_core_version = "16"
az_pstgre_we_sensor_db_core_zone    = null
db_zone                             = "3"
pstgre_db_username                  = "psqladmin"
pstgre_db_password                  = "HSh1CoR312345"
pstgre_storage_mb                   = 32768
pstgre_storage_tier                 = "P30"
pstgre_sku_name                     = "GP_Standard_D4ds_v5"
extenshion_name                     = "azure.extensions"
extenshion_value                    = ""
postgres_port                       = "5432"
sensor_db_name                      = "sensor-data"
timescaledb_extension_name          = "shared_preload_libraries"
timescaledb_extension_value         = "timescaledb,pg_cron,pg_stat_statements"
tablefunc_extension_name            = "azure.extensions"
tablefunc_extension_value           = "tablefunc,pg_cron,pg_stat_statements,UUID-OSSP,TIMESCALEDB"
dn_database_name                    = "dn"
inv_database_name                   = "lss"
inv_database_name_2                 = "wq"
inv_database_name_3                 = "inventory"
ch_database_name                    = "nursery"
ch_database_name_2                  = "user"
ch_database_name_3                  = "task"
inv_user1                           = "lss"
inv_user2                           = "wq"
inv_user3                           = "inventory"
inv_userdb_admin                    = ["reportingdb_admin", "inventorydb_admin"]
inv_userdb_appuser                  = ["reportingdb_appuser", "inventorydb_appuser"]
inv_user_db_map = {
  reportingdb_admin = "reportingdb"
  inventorydb_admin = "inventorydb"
}
reportingdb_admin = "reportingdb"
ch_user1          = "nursery"
ch_user2          = "user"
ch_user3          = "task"
ch_userdb_admin   = ["nurserydb_admin", "userdb_admin", "taskdb_admin"]
ch_userdb_appuser = ["nurserydb_appuser", "userdb_appuser", "taskdb_appuser"]
ch_user_db_map = {
  nurserydb_admin = "nurserydb"
  userdb_admin    = "usersdb"
  taskdb_admin    = "tasksdb"
}
ha_mode = "SameZone" ###  Currently ZoneRedundant is only supported in e.g. EastUS, WestUS3 etc, not supported in WestEurope


############################ Nursery Storage Account ###############################
lss_hist_storage_name  = "azsawefaplss"
ml_hist_storage_name   = "azsawefapml"
inv_storage_name       = "azsawefapinv"
sanursery              = "azsawenursery"
sanursery_pe_name_file = "AZ_PE_WE_CORE_TO_SA_NURSERY_FILE_CH"
sanursery_pe_name_blob = "AZ_PE_WE_CORE_TO_SA_NURSERY_BLOB_CH"

fapp_storage_acc_name = "azsawefappch"
blob_pe_to_fap_name   = "AZ_PE_WE_CORE_TO_SA_FAP_CH"
blob_pe_placeholder   = "blob-private-endpoint"
file_pe_to_fap_name   = "AZ_PE_WE_CORE_TO_SA_FAP_CH"
file_pe_placeholder   = "file-private-endpoint"
table_pe_to_fap_name  = "AZ_PE_WE_CORE_TO_SA_FAP_CH"
table_pe_placeholder  = "table-private-endpoint"
queue_pe_to_fap_name  = "AZ_PE_WE_CORE_TO_SA_FAP_CH"
queue_pe_placeholder  = "queue-private-endpoint"


########################## AGIC #####################################
gateway_ip_configuration               = "appgw-ip-config"
appgw_public_ip_name                   = "AZ_PIP_WE_APPGW"
zones                                  = ["1", "2", "3"]
sku_name                               = "Standard_v2"
sku_tier                               = "Standard_v2"
sku_capacity                           = 2
frontend_public_ip_configuration_name  = "appgw-public-frontend-ip"
frontend_private_ip_configuration_name = "appgw-private-frontend-ip"
ssl_certificate_name                   = "wildcard.ecoral.digycorp.com"
certfile_path                          = "files/wildcard.ecoral.digycorp.com.pfx"
cert_password                          = "pass123"
frontend_port                          = 80
backend_address_pool_name              = "appgw-backend-pool"
backend_http_settings_name             = "http-settings"
cookie_based_affinity                  = "Disabled"
backend_http_settings_port             = 80
backend_http_settings_protocol         = "Http"
request_timeout                        = 30
http_listener_name                     = "http-listener"
frontend_port_name                     = "http-port"
frontend_http_listener_protocol        = "Http"
request_routing_rule_name              = "http-rule"
rule_type                              = "Basic"

################################ Bastion ############################################

bastion_name                         = "AZ-VM-WE-BASTION"
bastion_nic_name                     = "AZ-NIC-WE-BASTION"
bastion_admin_username               = "azureuser"
bastion_admin_password               = "P@ssw0rd9242"
bastion_size                         = "Standard_D4as_v4"
bastion_os_disk_storage_account_type = "Premium_LRS"




###############################################MANAGED BY ZAMRAN##################################################
identity_name               = "AZ-UAMI-WE-BA-CORE"
lss_batch_name              = "azbawelsscore"
lss_batch_pe_name           = "AZ_PE_WE_CORE_TO_BA_WE_LSS_CORE"
lss_node_management         = "AZ_PE_WE_CORE_TO_BA_NM_WE_LSS_CORE"
lss_batch_pool_name         = "lss-batch-pool-01"
lss_acr_image_name          = "lss-data-bridge"
batch_private_dns_zone_name = "privatelink.batch.azure.com"
gitlab_resource_group_name  = "AZ_RG_WE_GITLAB"
core_lss_subnet_name        = "AZ_SNET_WE_PE_LSS"
core_lss_batch_subnet_name  = "AZ_SNET_WE_BA_LSS"
core_ml_batch_subnet_name   = "AZ_SNET_WE_BA_ML"

ml_batch_name      = "azbawemlcore"
ml_batch_pe_name   = "AZ_PE_WE_CORE_TO_BA_WE_ML_CORE"
ml_node_management = "AZ_PE_WE_CORE_TO_BA_NM_WE_ML_CORE"
ml_batch_pool_name = "ml-batch-pool-01"
ml_acr_image_name  = "ml-data-bridge"

eventhub_connection_name     = "AZ_PE_WE_CORE_TO_EH_WE_CORE"
core_eh_subnet_name          = "AZ_SNET_WE_PE_EH"
eh_private_dns_zone_name     = "privatelink.servicebus.windows.net"
core_lss_fap_subnet_name     = "AZ_SNET_WE_FA_LSS"
core_inv_fap_subnet_name     = "AZ_SNET_WE_FA_INV"
core_ml_fap_subnet_name      = "AZ_SNET_WE_FA_ML"
lss_function_app_pe_name     = "AZ_PE_WE_CORE_TO_LSS_FAP_CORE"
crs_function_app_pe_name     = "AZ_PE_WE_CORE_TO_CRS_FAP_CORE"
inv_ml_function_app_pe_name  = "AZ_PE_WE_CORE_TO_INV_ML_FAP_CORE"
inv_lss_function_app_pe_name = "AZ_PE_WE_CORE_TO_INV_LSS_FAP_CORE"
ml_function_app_pe_name      = "AZ_PE_WE_CORE_TO_ML_FAP_CORE"
core_inv_pe_subnet_name      = "AZ_SNET_WE_PE_INV"
core_inv_db_subnet_name      = "AZ_SNET_WE_DB_INV"
core_ml_pe_subnet_name       = "AZ_SNET_WE_PE_ML"
pe_subnet_ch_name            = "AZ_SNET_WE_PE_CH"
ch_eventhub_connection_name  = "AZ_PE_WE_CORE_TO_EH_WE_CH"
locationtopic_name           = "locationtopic"
task_eventhub_name           = "CH_TSK"
nursery_eventhub_name        = "CH_NR"
userstopic_name              = "userstopic"
sensortopic_name             = "sensortopic"
nurserytopic_name            = "nurserytopic"
waterchemistrytopic_name     = "waterchemistrytopic"
ml_batch_key                 = "ml-batch-key"
ml_cognito_username          = "ml-cognito-username"
ml_cognito_password          = "ml-cognito-password"
ml_kafka_access_key          = "ml-kafka-access-key"
ml_cognito_password_value    = "DigilabDigycorp92###"
ml_cognito_username_value    = "kiril.cvetkov@digycorp.com"
elastic_instance_minimum     = 1
pre_warmed_instance_count    = 1
###############################################MANAGED BY ZAMRAN##################################################

################################ Shiny vm ############################################

shiny_vm_name                         = "AZ-VM-WE-INV"
shinyapp_nic_name                     = "AZ-NIC-WE-INV"
shiny_vm_admin_username               = "azureuser"
shiny_vm_admin_password               = "P@ssw0rd9242"
shiny_vm_size                         = "Standard_B2ms"
shiny_vm_os_disk_storage_account_type = "Premium_LRS"
diagnostic_storage_account_name       = "azsawebootdiagappinv"
diagnostic_storage_account_tier       = "Standard"


################################ ACS ################################################
acs_name = "AZ-ACS-WE-KCRI-CH-EMAIL-SERVICE"

################################ ECS #######################
ecs_name                = "AZ-ECS-WE-KCRI-CH-EMAIL-SERVICE"
ecs_service_domain_name = "AzureManagedDomain"
domain_management       = "AzureManaged"

########### Log Analytics Workspace ########################
azurerm_log_analytics_workspace_name = "AZ-LAW-WE-KCRI-LOGS"
soc_security_rg_name                 = "AZ-RG-WE-SOC-SECURITY"

lss_password = "kkk128"
db_user      = "reportingdb-user"
db_passwd    = "reportingdb-password"
db_name      = "reportingdb-name"
reportingdb  = "reportingdb-host"

app_name = "e-coral-auth-uat-test-two"

acrdpcore_name             = "azcrwedpcore"
dashboard_name             = "ch_dashboard"
ml_function_app_access_key = "ml-function-key"

# git lab

gitlab_url                = "https://gitlab.kaust.edu.sa//api/v4/"
gitlab_ch_nursery_repo_id = "34165" #ch project id for ch nursery
gitlab_ch_users_repo_id   = "34168" #ch project id for ch nursery
adf_name                  = "AZ-ADF-WE-CORE"

