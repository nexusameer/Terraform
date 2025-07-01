module "rg" {
  source      = "./modules/resource_group"
  rg_name     = var.rg_name
  location    = var.location
}

module "vnet" {
  source      = "./modules/vnet"
  vnet_name   = var.vnet_name
  rg_name     = module.rg.name
  location    = var.location
  address_space = var.address_space
  subnet_prefixes = var.subnet_prefixes
}

module "storage" {
  source          = "./modules/storage_account"
  storage_name    = var.storage_name
  rg_name         = module.rg.name
  location        = var.location
  account_tier    = var.account_tier
  replication_type = var.replication_type
}
