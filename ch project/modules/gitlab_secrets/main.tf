
resource "gitlab_project_variable" "CH_USERS_LOGGING_LEVEL" {
  project           = var.gitlab_ch_users_repo_id
  key               = "LOGGING_LEVEL_ORG_SPRINGFRAMEWORK_WEB_FILTER_COMMONSREQUESTLOGGINGFILTER_${var.environment}"
  value             = "DEBUG"
  environment_scope = var.environment_scope
  description       = "${var.environment} Logging Filter"
  raw               = true
  protected         = false
  masked            = false
  provider          = gitlab
}

resource "gitlab_project_variable" "CH_USERS_HEADER_SIZE" {
  project           = var.gitlab_ch_users_repo_id
  key               = "SERVER_MAX_HTTP_REQUEST_HEADER_SIZE_${var.environment}"
  value             = "40000"
  environment_scope = var.environment_scope
  description       = "${var.environment} Request Header Size"
  raw               = true
  protected         = false
  masked            = false
  provider          = gitlab
}

resource "gitlab_project_variable" "CH_USERS_DB_PASSWORD" {
  project           = var.gitlab_ch_users_repo_id
  key               = "SPRING_DATASOURCE_PASSWORD_${var.environment}"
  value             = var.pstgre_db_password
  environment_scope = var.environment_scope
  description       = "${var.environment} DB Password"
  raw               = true
  protected         = false
  masked            = false
  provider          = gitlab
}

resource "gitlab_project_variable" "CH_USERS_DB_URL" {
  project           = var.gitlab_ch_users_repo_id
  key               = "SPRING_DATASOURCE_URL_${var.environment}"
  value             = "jdbc:postgresql://${var.ch_database_host}:5432/usersdb"
  environment_scope = var.environment_scope
  description       = "${var.environment} DB URL"
  raw               = true
  protected         = false
  masked            = false
  provider          = gitlab
}

resource "gitlab_project_variable" "CH_USERS_DB_USERNAME" {
  project           = var.gitlab_ch_users_repo_id
  key               = "SPRING_DATASOURCE_USERNAME_${var.environment}"
  value             = var.pstgre_db_username
  environment_scope = var.environment_scope
  description       = "${var.environment} DB Username"
  raw               = true
  protected         = false
  masked            = false
  provider          = gitlab
}

terraform {
  required_providers { gitlab = { source = "gitlabhq/gitlab" } }
}

