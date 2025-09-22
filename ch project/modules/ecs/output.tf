output "id" {
  value = azurerm_email_communication_service.ecs.id
}

output "ecs_domain_id" {
  value = azurerm_email_communication_service_domain.ecs_service_domain.id
}

output "from_sender_domain" {
  description = "P2 sender domain that is displayed to the email recipients [RFC 5322]."
  value       = azurerm_email_communication_service_domain.ecs_service_domain.from_sender_domain
}

output "mail_from_sender_domain" {
  description = "P1 sender domain that is present on the email envelope [RFC 5321]."
  value       = azurerm_email_communication_service_domain.ecs_service_domain.mail_from_sender_domain
}

output "verification_records" {
  value = azurerm_email_communication_service_domain.ecs_service_domain.verification_records
} 