variable "bucket_arn" {
  description = "ARN of the S3 bucket that EC2 can read"
  type        = string
}

variable "kms_key_arn" {
  description = "ARN of the KMS key used to encrypt S3 objects"
  type        = string
}