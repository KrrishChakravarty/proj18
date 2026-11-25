terraform {
  required_providers {
    random = { source = "hashicorp/random" }
    local  = { source = "hashicorp/local" }
  }
}

resource "random_pet" "name" {
  length = 2
}

resource "local_file" "config" {
  filename = "${path.module}/deployed.txt"
  content  = "Infra version 2 deployed for ${random_pet.name.id}\n"
}

output "deployed_name" {
  value = random_pet.name.id
}
