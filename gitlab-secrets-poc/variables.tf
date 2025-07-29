variable "project_id" {
  type        = string
  description = "GitLab project ID"
}

variable "secret_value" {
  type        = string
  description = "First secret value"
}

variable "secret_value_2" {
  type        = string
  description = "Second secret value"
}

variable "gitlab_token" {
  type        = string
  description = "GitLab Personal Access Token"
  sensitive   = true
}

variable "gitlab_url" {
  type        = string
  description = "GitLab API URL"
}

variable "random" {
  
}
