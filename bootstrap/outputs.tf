output "bucket_bootstrap_name" {
  description = "Name of the S3 bucket used for Terraform state"
  value       = aws_s3_bucket.s3_bucket_bootstrap.bucket
}

output "db_name" {
  description = "Name of the DynamoDB table used for state locking"
  value       = aws_dynamodb_table.terraform_lock.name
}

output "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt Terraform state objects"
  value       = aws_kms_key.bootstrap.arn
}

output "backend_role_arn" {
  description = "ARN del ruolo IAM per l'accesso al backend Terraform"
  value       = module.backend_iam.backend_role_arn
}
