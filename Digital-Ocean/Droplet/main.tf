module "Review_Droplet" {
  source = "./modules/Droplet"
  region  = var.region
  size    = var.size
  image   = var.image
  ssh_key_id = var.ssh_key_id

}