provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}


# Resource Group Module
module "resource_group" {
  source   = "./modules/resource_group"
  rg_name  = var.rg_name
  location = var.location
}

# Storage Account Module
module "storage_account" {
  source               = "./modules/storage_account"
  storage_account_name = var.storage_account_name
  rg_name              = module.resource_group.rg_name
  location             = module.resource_group.rg_location
}

# Virtual Network Module
module "vnet" {
  source        = "./modules/vnet"
  vnet_name     = var.vnet_name
  rg_name       = module.resource_group.rg_name
  location      = module.resource_group.rg_location
  subnet_name   = var.subnet_name
  address_space = var.address_space
  subnet_prefix = var.subnet_prefix
}

# Network Interface Module
module "nic" {
  source    = "./modules/nic"
  nic_name  = var.nic_name
  rg_name   = module.resource_group.rg_name
  location  = module.resource_group.rg_location
  subnet_id = module.vnet.subnet_id
}

# Virtual Machine Module
module "vm" {
  source               = "./modules/vm"
  vm_name              = var.vm_name
  resource_group_name  = module.resource_group.rg_name
  location             = module.resource_group.rg_location
  network_interface_id = module.nic.nic_id
  vm_size              = var.vm_size
  admin_user           = var.admin_user
  admin_pass           = var.admin_pass
}
