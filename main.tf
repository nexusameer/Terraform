terraform {
  required_version = ">= 1.7.0"

  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}

provider "digitalocean" {
  token = var.digitalocean_token
}

resource "digitalocean_droplet" "web" {
  image     = "ubuntu-24-04-x64"
  name      = "web"
  region    = "nyc1"
  size      = "s-1vcpu-1gb"
  user_data = file("init-script.sh")
  ssh_keys  = var.ssh_key
}
