terraform {
  backend "s3" {
    bucket         = "NOME_BUCKET_BOOTSTRAP"
    key            = "terraform-lab/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
    kms_key_id     = "ARN_CHIAVE_KMS"
  }
}