terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "18.1.1"
    }
  }
}

resource "gitlab_project_variable" "secrets" {
  for_each = var.secrets

  project           = var.project_id
  key               = each.key
  value             = each.value.value
  protected         = each.value.protected
  masked            = each.value.masked
  environment_scope = each.value.scope
  raw               = true
}
