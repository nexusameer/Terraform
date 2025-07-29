data "azurerm_client_config" "current" {}


module "rg" {
    source = "./modules/rg"
    rg_name = var.rg_name
    rg_location = var.rg_location
}

module "vnet" {
    source = "./modules/vnet"
    vnet_name = var.vnet_name
    rg_name = module.rg.rg_name
    rg_location = module.rg.rg_location
    subnet_name = var.subnet_name
    subnet_prefix = var.subnet_prefix
    address_space = var.address_space
}

module "akv" {
    source = "./modules/akv"
    akv_name = var.akv_name
    rg_name = module.rg.rg_name
    rg_location = module.rg.rg_location
    tenant_id   = data.azurerm_client_config.current.tenant_id
    object_id   = data.azurerm_client_config.current.object_id
    ssh_key     = file("~/.ssh/id_rsa.pub")
}

module "aks" {
    source = "./modules/aks"
    aks_name = var.aks_name
    rg_name = module.rg.rg_name
    rg_location = var.rg_location
    node_count = var.node_count
    node_pool_name = var.node_pool_name
    vm_size = var.vm_size
    subnet_id      = module.vnet.subnet_id
} 