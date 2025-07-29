terraform {
  required_providers {
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
  }
}


# Create a new Web Droplet in the nyc2 region
resource "digitalocean_droplet" "Review" {
    image   = var.image
    name    = "Review"
    region  = var.region
    size    = var.size
    ssh_keys = var.ssh_key_id

    tags    = ["ameer_hamza"]
}