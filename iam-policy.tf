data "aws_iam_policy_document" "s3_read_write" {

  statement {
    sid    = "AllowS3ObjectReadWrite"
    effect = "Allow"

    actions = [
      "s3:GetObject",
      "s3:PutObject"
    ]

    resources = [
      "${aws_s3_bucket.storage.arn}/*"
    ]
  }

  statement {
    sid    = "AllowS3ListBucket"
    effect = "Allow"

    actions = [
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.storage.arn
    ]
  }
}

data "aws_iam_policy_document" "ec2_assume_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole"
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com"
      ]
    }
  }
}

resource "aws_iam_policy" "s3_read_write" {
  name        = "s3-read-write-policy"
  description = "Policy for reading and writing objects in S3"

  policy = data.aws_iam_policy_document.s3_read_write.json
}

resource "aws_iam_role" "ec2_s3_role" {
  name = "ec2-s3-role"

  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role.json
}

resource "aws_iam_user" "developer_jacopo" {
  name = "developer-jacopo"
  path = "/system/"

  tags = {
    tag-key = "developer-jacopo"
  }
}

resource "aws_iam_group" "developers" {
  name = "developers"
}

resource "aws_iam_user_group_membership" "group_membership" {
  user = aws_iam_user.developer_jacopo.name

  groups = [
    aws_iam_group.developers.name
  ]
}

resource "aws_iam_role_policy_attachment" "ec2_s3_read_write" {
  role       = aws_iam_role.ec2_s3_role.name
  policy_arn = aws_iam_policy.s3_read_write.arn
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.developers.name
  policy_arn = aws_iam_policy.s3_read_write.arn
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.ec2_s3_role.name
}