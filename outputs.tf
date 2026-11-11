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

output "aws_vpc_id" {
  value = aws_vpc.main.id
}

output "aws_private_subnet_id" {
  value = aws_subnet.subnet_private.id
}

output "aws_public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "aws_security_group_id" {
  value = aws_security_group.web.id
}

output "aws_ec2_instance_id" {
  value = aws_instance.linux.id
}
output "aws_s3_bucket_name" {
  value = aws_s3_bucket.storage.id
}