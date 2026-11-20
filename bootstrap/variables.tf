variable "s3_bucket_bootstrap" {
  description = "Globally unique name of the S3 bucket used for Terraform state"
  type        = string
}

variable "tags" {
  description = "Tags applied to bootstrap resources"
  type        = map(string)
}

variable "trusted_principal_arn" {
  description = "ARN dell'identità AWS autorizzata ad assumere il ruolo backend"
  type        = string
}
