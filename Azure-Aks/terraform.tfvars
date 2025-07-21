# Resource Group
rg_name      = "devops-rg"
rg_location  = "East US"

# Virtual Network
vnet_name     = "devops-vnet"
address_space = ["10.0.0.0/16"]
subnet_name   = "aks-subnet"
subnet_prefix = "10.0.1.0/24"

# Azure Key Vault
akv_name = "devopskeyvault123"

# AKS Cluster
aks_name       = "devops-aks"
node_count     = 1
node_pool_name = "default"
vm_size        = "Standard_DS2_v2"
