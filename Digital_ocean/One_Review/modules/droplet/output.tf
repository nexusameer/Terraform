output "droplet_name" {
  value = digitalocean_droplet.i_review.name 
}

output "droplet_ip" {
  value = digitalocean_droplet.i_review.ipv4_address
}