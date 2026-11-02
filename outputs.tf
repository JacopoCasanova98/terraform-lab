output "file_name" {
  description = "Nome del file creato"
  value       = local_file.main.filename
}

output "file_content" {
  description = "Contenuto del file"
  value       = local_file.main.content
}
