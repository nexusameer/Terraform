module "i_review" {
  source = "./modules/droplet"
  region  = var.region
  size    = var.size
  image   = var.image
  ssh_key_id = var.ssh_key_id

}

# resource "local_file" "ansible_inventory" {
#   content  = <<-EOT
#   [review]
#   ${module.i_review.droplet_ip} ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa
#   EOT

#   filename = "${path.cwd}/ansible/i_inventory.ini"
#   # filename = "/home/user/projects/One_Review/ansible/i_inventory.ini"
  
#   file_permission = "0777"
#   directory_permission = "0777"
# }

resource "local_file" "ansible_inventory" {
  content  = <<-EOT
  [staging]
  ${module.i_review.droplet_ip} ansible_user=root ansible_ssh_private_key_file=~/.ssh/id_rsa
  EOT
  filename = "${path.module}/../ansible/inventory.ini"
  file_permission = "0777"
  directory_permission = "0777"
}