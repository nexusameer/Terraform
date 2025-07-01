output "resource_group_name" { 
    value = module.rg.name 
}
output "vnet_name" { 
    value = module.vnet.name 
}
output "storage_account_name" { 
    value = module.storage.name 
}
output "storage_primary_web_endpoint" { 
    value = module.storage.primary_web_endpoint 
}
