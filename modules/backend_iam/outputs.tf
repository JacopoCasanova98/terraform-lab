output "backend_role_arn" {
  description = "ARN of the IAM role used by Terraform backend"
  value       = aws_iam_role.backend.arn
}

output "backend_role_name" {
  description = "Name of the IAM role used by Terraform backend"
  value       = aws_iam_role.backend.name
}

output "backend_policy_arn" {
  description = "ARN of the IAM policy attached to the backend role"
  value       = aws_iam_policy.backend_policy.arn
}