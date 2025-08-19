terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}


resource "digitalocean_droplet" "i_review" {
    image   = var.image
    name    = "review"
    region  = var.region
    size    = var.size
    ssh_keys = var.ssh_key_id

    tags    = ["ameerhamza", "ireview"]
}