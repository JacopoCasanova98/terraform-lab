output "file_name" {
  description = "Nome del file creato"
  value       = local_file.main.filename
}

output "file_content" {
  description = "Contenuto del file"
  value       = local_file.main.content
}

output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_arn" {
  value = data.aws_caller_identity.current.arn
}

output "aws_user_id" {
  value = data.aws_caller_identity.current.user_id
}