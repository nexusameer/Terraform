data "azuread_client_config" "current" {}

resource "azuread_group" "group" {
  display_name     = "GROUP"
  owners           = [data.azuread_client_config.current.object_id]
  security_enabled = true
}