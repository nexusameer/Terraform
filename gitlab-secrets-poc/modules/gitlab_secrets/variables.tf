variable "project_id" {
  type        = string
  description = "GitLab project ID"
}

variable "secrets" {
  type = map(object({
    value     = string
    protected = optional(bool, false)
    masked    = optional(bool, true)
    scope     = optional(string, "*")
  }))
  description = "Map of GitLab secret variables"
}
