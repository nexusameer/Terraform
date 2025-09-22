variable "app_name" {}

variable "redirect_uri" {
  description = "Web redirect URI (e.g. NextAuth callback URL)"
  type        = string
  default     = "https://e-coral-auth-uat-terraform-test-two.azurewebsites.net/api/auth/callback/azure-ad"
}