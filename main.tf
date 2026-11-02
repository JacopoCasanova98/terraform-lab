terraform {
  required_providers {
    local = {
      source  = "hashicorp/local"
      version = "2.9.1"
    }
  }
}

resource "local_file" "example" {
  filename = local.file_name
  content  = var.file_content
}

resource "local_file" "copy" {
  filename = "copy.txt"
  content  = local_file.example.content
}
