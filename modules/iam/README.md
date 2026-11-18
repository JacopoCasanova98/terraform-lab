
# IAM Module

## Overview

Creates the IAM resources required by the EC2 instance
to access objects in the S3 bucket and decrypt them using KMS.

## Resources

- IAM Role trusted by the EC2 service
- IAM Policy with S3 read permissions and KMS decrypt permission
- IAM Role Policy Attachment
- IAM Instance Profile

## Inputs

| Name | Description | Type |
|---|---|---|
| bucket_arn | ARN of the S3 bucket | string |
| kms_key_arn | ARN of the KMS key | string |

## Outputs

| Name | Description |
|---|---|
| iam_role_name | Name of the IAM role |
| instance_profile_name | Name of the EC2 instance profile |

## Usage

```hcl
module "iam" {
  source = "./modules/iam"

  bucket_arn  = module.storage.bucket_arn
  kms_key_arn = module.storage.kms_key_arn
}
```

## Dependencies

The module receives the bucket and KMS key ARNs from
the storage module.

The instance module consumes the instance profile
exposed by this module.

## Permissions

The IAM policy grants:

- `s3:ListBucket` on the bucket
- `s3:GetObject` on objects in the bucket
- `kms:Decrypt` on the configured KMS key
