
resource "aws_s3_bucket" "s3_bucket_bootstrap" {
  bucket = var.s3_bucket_bootstrap
  tags   = var.tags
}

resource "aws_s3_bucket_versioning" "versioning_bootstrap" {
  bucket = aws_s3_bucket.s3_bucket_bootstrap.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_public_access_block" "bootstrap" {
  bucket = aws_s3_bucket.s3_bucket_bootstrap.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_kms_key" "bootstrap" {
  description             = "Key used to encrypt Terraform state objects"
  deletion_window_in_days = 10
}

resource "aws_s3_bucket_server_side_encryption_configuration" "bootstrap" {
  bucket = aws_s3_bucket.s3_bucket_bootstrap.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.bootstrap.arn
      sse_algorithm     = "aws:kms"
    }
  }
}

resource "aws_dynamodb_table" "terraform_lock" {
  name         = "terraform-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.tags
}

data "aws_caller_identity" "current" {}

module "backend_iam" {
  source = "../modules/backend_iam"

  bucket_name         = aws_s3_bucket.s3_bucket_bootstrap.bucket
  state_key           = "terraform-lab/terraform.tfstate"
  dynamodb_table_name = aws_dynamodb_table.terraform_lock.name
  kms_key_arn         = aws_kms_key.bootstrap.arn
  aws_account_id      = data.aws_caller_identity.current.account_id

  trusted_principal_arn = var.trusted_principal_arn
}