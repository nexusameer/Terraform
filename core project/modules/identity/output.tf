output "batch_identity" {
  value = azurerm_user_assigned_identity.batch_identity.id
}

output "batch_identity_principal_id" {
  value = azurerm_user_assigned_identity.batch_identity.principal_id
}


output "batch_identity_name" {
  value = azurerm_user_assigned_identity.batch_identity.name
}
