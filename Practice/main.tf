resource "local_file" "example" {
  content  = "my pet name is ${random_pet.my_pet.id}"
  filename = var.filename
}

resource "random_pet" "my_pet" {
    prefix = var.prefix
}
