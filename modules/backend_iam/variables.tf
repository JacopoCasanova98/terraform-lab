variable "bucket_name" {
  type = string
}

variable "state_key" {
  type = string
}

variable "dynamodb_table_name" {
  type = string
}

variable "kms_key_arn" {
  type = string
}

variable "aws_account_id" {
  type = string
}

variable "trusted_principal_arn" {
  description = "ARN dell'identità AWS autorizzata ad assumere il ruolo"
  type        = string
}