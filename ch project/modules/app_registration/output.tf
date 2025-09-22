output "ecoral_app_secret" {
  value     = azuread_application_password.ecoral_secret.value
  sensitive = true
}

output "ecoral_app_name" {
  value = azuread_application.ecoral.display_name
}