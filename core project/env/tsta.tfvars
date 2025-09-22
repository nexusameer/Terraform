######################## Environment Configuration ###########################

environment              = "TSTA"
core_subscription_id     = "06fc98c8-18f1-4cd7-bc57-5d566cf331bd"
apps_subscription_id     = "8fe971e5-6ea8-448c-9936-ca218a1e908c"
connectivity_subscription_id = "42972dc3-a430-4050-8162-b2e7937bc192"
management_subscription_id = "54e40e11-f09e-481d-a80d-22eb8ad32ee6"
tre_subscription_id     = "a04d67fe-e2b1-46de-aa59-21135ede95a2"

tags = {
  created_by = "DigyCorp"
}

######################## Resource Group ######################################

core_rg   = "AZ_RG_WE_CORE"
dns_rg    = "AZ_RG_WE_DNS"
kcri_rg   = "AZ_RG_WE_CORE"

################################ vnet #######################################

core_vnet = "AZ_VNET_WE_CORE"


################################# Subnet #######################################

core_function_app_subnet_name = "AZ_SNET_WE_FA_SENSOR"
pe_subnet_name                = "AZ_SNET_WE_PE_SENSOR"
batch_account_subnet_name     = "AZ_SNET_WE_BA_SENSOR"
core_db_subnet                = "AZ_SNET_WE_DB_SENSOR"

################################# Private DNS #######################################

acr_private_dns_name           = "privatelink.azurecr.io"
file_private_dns_zone_name     = "privatelink.file.core.windows.net"
blob_private_dns_zone_name     = "privatelink.blob.core.windows.net"
queue_private_dns_zone_name    = "privatelink.queue.core.windows.net"
table_private_dns_zone_name    = "privatelink.table.core.windows.net"
fap_private_dns_zone_name      = "privatelink.azurewebsites.net"
batch_private_dns_zone_name    = "privatelink.batch.azure.com"
keyvault_private_dns_zone_name = "privatelink.vaultcore.azure.net"
psql_private_dns_zone_name     = "privatelink.postgres.database.azure.com"

######################## Container Registry #############################

acr_name        = "azcrwedpcore"
connection_name = "AZ_PE_WE_CORE_TO_CR_WE_DP_CORE"

############################ Key Vault ###############################

keyvault_name = "AZ-KV-WE-CORE"
pe_name       = "AZ_PE_WE_CORE_TO_KV_CORE"


############################ Function App ###############################

service_plan_name     = "AZ-ASP-PREM-WE-CORE"
function_app_name     = "AZ-FAPP-WE-DP-CORE"
fapp_storage_acc_name = "azsawefappcore"
function_app_pe_name  = "AZ_PE_WE_CORE_TO_FAP_CORE"
blob_pe_to_fap_name   = "AZ_PE_WE_CORE_TO_SA_FAP_CORE"
blob_pe_placeholder   = "blob-private-endpoint"
file_pe_to_fap_name   = "AZ_PE_WE_CORE_TO_SA_FAP_CORE"
file_pe_placeholder   = "file-private-endpoint"
table_pe_to_fap_name  = "AZ_PE_WE_CORE_TO_SA_FAP_CORE"
table_pe_placeholder  = "table-private-endpoint"
queue_pe_to_fap_name  = "AZ_PE_WE_CORE_TO_SA_FAP_CORE"
queue_pe_placeholder  = "queue-private-endpoint"


############################ Batch Account ###############################

batch_name            = "azbawedpcore"
batch_pe_name         = "AZ_PE_WE_CORE_TO_BA_WE_DP_CORE"
node_management       = "AZ_PE_WE_CORE_TO_BA_NM_WE_DP_CORE"
identity_name         = "AZ-UAMI-WE-BA-CORE"
batch_pool_name       = "batch-pool-01"
shinyapp_batch_name   = "shinyapp-batch"
shinyapp_db_name      = "shinyapp-db"
shinyapp_storage_name = "shinyapp-storage"
acr_image_name        = "reef-pipeline"

############################ Data Factory ###############################

adf_name                        = "AZ-ADF-WE-CORE"
storage_private_endpoint_name   = "AZ_PE_WE_ADF_CORE_TO_SA_STAGING_CORE"
vault_private_endpoint_name     = "AZ_PE_WE_ADF_CORE_TO_KV_CORE"
fap_pe_name                     = "AZ_PE_WE_ADF_CORE_TO_FAP_CORE"
datalake_private_endpoint_name  = "AZ_PE_WE_ADF_CORE_TO_SA_DATALAKE_CORE"
core_storage_account_name       = "AZ_SA_WE_STAGING_CORE"
datalake_linked_name            = "AZ_SA_WE_DATALAKE_CORE"
keyvault_linked_name            = "AZ_KV_WE_CORE"
az_law_we_security_logs         = "AZ-LAW-WE-SECURITY-LOGS"
az_law_we_activity_logs         = "AZ-LAW-WE-ACTIVITY-LOGS"
keyvault_connection_name        = "az-adf-we-core"
keyvault_connection_name_suffix = ".AZ_PE_WE_ADF_CORE_TO_KV_CORE"
datalake_name                   = "azsawedatalakescore"
function_app_linked_name        = "AZ_FAP_WE_CORE"


############################ Postgres ###############################

az_pstgre_we_sensor_db_core         = "az-pstgre-we-sensor-db-core"
az_pstgre_we_sensor_db_core_version = "16"
az_pstgre_we_sensor_db_core_zone    = "2"
pstgre_db_username                  = "psqladmin"
pstgre_db_password                  = "HSh1CoR312345"
pstgre_storage_mb                   = 32768
pstgre_storage_tier                 = "P30"
pstgre_sku_name                     = "GP_Standard_D4ds_v5"
azure_extensions_name               = "azure.extensions"
azure_extensions_values             = "UUID-OSSP,TIMESCALEDB"
postgres_port                       = "5432"
sensor_db_name                      = "sensor-data"
shared_preload_libraries_name       = "shared_preload_libraries"
shared_preload_libraries_values     = "timescaledb,pg_cron,pg_stat_statements"




############################ Storage Account ###############################

file_pe_to_datalake_name       = "AZ_PE_WE_CORE_TO_SA_DATALAKE_CORE"
datalake_private_dns_zone_name = "azsawedatalakescore"
corekvap                       = "kvap-staging"
coresensor                     = "sensor-staging"
azsawestagingcore              = "azsawestagecore"
blob_pe_to_datalake_name       = "AZ_PE_WE_CP_SENSOR_TO_SA_DATALAKE_CORE"

# ip_rules_coer_sa = [
#   "109.171.158.44",
#   "109.171.145.67",
#   "109.171.133.145",
#   "109.171.133.180",
#   "110.39.153.114", #Clustox IP
#   "110.39.12.130"

# ]


############################ Bastion Host ###############################

core_bastion_pip = "AZ_PIP_WE_BASTION_CORE"
bastion_name     = "AZ_BASTION_WE_CORE"



dashboard_name = "core_dashboard"
digital_assets_core = "digitalassets"
digital_assets_staging = "digital-assets-staging"
digital_assets_datalake = "digitalassets"
da_staging_datalake  = "da-staging"
soc_security_rg_name = "AZ-RG-WE-SOC-SECURITY"
backup_vault_name = "BackupVault"
psql_policy_name = "psql-policy"
storage_account_policy_name = "storage-account-policy"
core_datalake_access_key    = "core-datalake-access-key"
databricks_name = "AZ-ADB-WE-CORE"

loganalytics_workspace_name = "AZ-LAW-WE-KCRI-LOGS"