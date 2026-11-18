
# Storage Module

## Overview

Creates S3 storage resources and configures server-side
encryption using AWS KMS.

## Resources

- S3 Bucket
- S3 Public Access Block
- S3 Bucket Versioning
- KMS Key
- S3 Server-Side Encryption Configuration

## Inputs

| Name | Description | Type |
|---|---|---|
| bucket_name | Name of the S3 bucket | string |
| tags | Tags applied to supported resources | map(string) |

## Outputs

| Name | Description |
|---|---|
| bucket_name | Name of the S3 bucket |
| bucket_arn | ARN of the S3 bucket |
| kms_key_arn | ARN of the KMS key |

## Usage

```hcl
module "storage" {
  source = "./modules/storage"

  bucket_name = var.storage_bucket_name
  tags        = var.tags
}
```

## Notes

The bucket uses versioning and SSE-KMS encryption.

The bucket ARN and KMS key ARN are consumed by the IAM module
to define the permissions granted to the EC2 role.
