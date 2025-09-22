terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = "3.3.0"
    }
  }
}

resource "random_uuid" "claim_read_scope_id" {}
resource "random_uuid" "spring_connect_scope_id" {}

resource "azuread_application" "ecoral" {
  provider         = azuread
  display_name     = var.app_name
  sign_in_audience = "AzureADMyOrg" # single-tenant
  identifier_uris  = ["api://${var.app_name}"]

  web {
    redirect_uris = [var.redirect_uri]

    implicit_grant {
      access_token_issuance_enabled = true
      id_token_issuance_enabled     = true
    }
  }
}


resource "azuread_application_password" "ecoral_secret" {
  provider       = azuread
  application_id = azuread_application.ecoral.id
  end_date       = "2025-12-31T23:59:59Z"
  display_name   = "e-coral-auth-uat secret-test"
}

resource "azuread_application_permission_scope" "claim_read_scope" {
  provider       = azuread
  application_id = azuread_application.ecoral.id
  scope_id       = random_uuid.claim_read_scope_id.result
  value          = "claim.read"

  admin_consent_description  = "Admin consent for claim.read"
  admin_consent_display_name = "Claim Read"
}


resource "azuread_application_permission_scope" "spring_connect_scope" {
  provider       = azuread
  application_id = azuread_application.ecoral.id
  scope_id       = random_uuid.spring_connect_scope_id.result
  value          = "SpringConnect"

  admin_consent_description  = "Admin consent for SpringConnect"
  admin_consent_display_name = "Spring Connect"
}

# data "azuread_service_principal" "ecoral_sp" {
#   client_id  = azuread_application.ecoral.client_id  
# }

resource "azuread_application_api_access" "ecoral_api_access" {
  provider       = azuread
  application_id = azuread_application.ecoral.id

  api_client_id = azuread_application.ecoral.client_id

  scope_ids = [
    azuread_application_permission_scope.claim_read_scope.scope_id,
    azuread_application_permission_scope.spring_connect_scope.scope_id
  ]
  depends_on = [azuread_application.ecoral]
}
