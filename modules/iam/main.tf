resource "aws_iam_role" "iam_role" {
  name = "iam_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_policy" "policy" {
  name        = "read_policy"
  path        = "/"
  description = "My read policy"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "kms:Decrypt",
        ]
        Effect   = "Allow"
        Resource = "var.bucket_name"
      },
      {
        Action = [
          "s3:ListBucket",
        ]
        Effect   = "Allow"
        Resource = "var.bucket_name"
      },
      {
        Action = [
          "s3:GetObject",
        ]
        Effect   = "Allow"
        Resource = "var.bucket_name"
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "test-attach" {
  role       = aws_iam_role.iam_role.name
  policy_arn = aws_iam_policy.policy.arn
}

resource "aws_iam_instance_profile" "instance_profile" {
  name = "instance_profile"
  role = aws_iam_role.iam_role.name
}