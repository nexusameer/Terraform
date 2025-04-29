variable "digitalocean_token" {
  description = "The DigitalOcean API token"
  type        = string
  sensitive   = true  # Ensures the value is hidden in Terraform outputs
}

variable "ssh_key" {
  description = "SSH Key for accessing the droplet"
  type        = list(string)
}
