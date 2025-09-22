terraform {
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "2.60.0"
    }
  }
}


resource "digitalocean_droplet" "Review" {
    image   = var.image
    name    = "Review"
    region  = var.region
    size    = var.size
    ssh_keys = var.ssh_key_id

    tags    = ["ameer_hamza"]
}