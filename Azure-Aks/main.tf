data "azurerm_client_config" "current" {}


module "resource_group" {
    source = "./modules/rg"
    rg_name = var.rg_name
    rg_location = var.rg_location
}

module "vnet" {
    source = "./modules/vnet"
    vnet_name = var.vnet_name
    rg_location = module.rg.rg_location
    rg_name = module.rg.rg_name
}

module "akv" {
    source = "./modules/akv"
    akv_name = var.akv_name
    rg_location = module.rg.rg_location
    rg_name = module.rg.rg_name
}

module "aks" {
    source = "./modules/aks"
    aks_name = var.aks_name
    rg_location = var.rg_location
    node_count = var.node_count
    node_pool_name = var.node_pool_name
    vm_size = var.vm_size
    rg_name = module.rg.rg_name
}