output "pet_name" {
  value = random_pet.my_pet.id
  description = "The randomly generated pet name"
}

output "pet_name_with_prefix" {
  value = random_pet.my_pet.id
  description = "The complete pet name including prefix"
}

output "pet_file_content" {
  value = local_file.example.content
  description = "Content of the pet name file"
}