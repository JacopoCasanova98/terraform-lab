
resource "aws_iam_policy" "backend_policy" {
  name        = "backend_policy"
  path        = "/"
  description = "Permissions required by Terraform to access its remote state"

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Sid    = "S3BucketAccess"
        Effect = "Allow"

        Action = [
          "s3:ListBucket"
        ]

        Resource = "arn:aws:s3:::${var.bucket_name}"
      },
      {
        Sid    = "S3StateObjectAccess"
        Effect = "Allow"

        Action = [
          "s3:GetObject",
          "s3:PutObject",
          "s3:DeleteObject"
        ]

        Resource = "arn:aws:s3:::${var.bucket_name}/${var.state_key}"
      },
      {
        Sid    = "DynamoDBStateLockAccess"
        Effect = "Allow"

        Action = [
          "dynamodb:DescribeTable",
          "dynamodb:GetItem",
          "dynamodb:PutItem",
          "dynamodb:DeleteItem"
        ]

        Resource = "arn:aws:dynamodb:us-east-1:${var.aws_account_id}:table/${var.dynamodb_table_name}"
      },
      {
        Sid    = "KMSStateEncryptionAccess"
        Effect = "Allow"

        Action = [
          "kms:DescribeKey",
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:GenerateDataKey"
        ]

        Resource = var.kms_key_arn
      }
    ]
  })
}

resource "aws_iam_role" "backend" {
  name = "terraform_backend_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"

        Principal = {
          AWS = var.trusted_principal_arn
        }
      }
    ]
  })

  tags = {
    Purpose = "Terraform backend access"
  }
}


resource "aws_iam_role_policy_attachment" "backend_role_policy_attachment" {
  role       = aws_iam_role.backend.name
  policy_arn = aws_iam_policy.backend_policy.arn
}