
module "Review" {
    source = "./Droplet"
    image   = var.image
    region  = var.region
    size    = var.size
    ssh_key_id = var.ssh_key_id

    providers = {
    digitalocean = digitalocean
  }
}