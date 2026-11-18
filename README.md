# Terraform AWS Infrastructure

## Overview

Infrastructure as Code project built with Terraform and AWS.
The project provisions a modular AWS architecture composed of:

- VPC and networking components
- EC2 instance
- S3 storage
- IAM role and permissions
- KMS encryption

## Architecture

The root module orchestrates the following child modules:

- network
- instance
- storage
- iam

## Requirements

- Terraform >= 1.5.0
- AWS CLI
- AWS credentials configured
- AWS provider ~> 6.0

## Project Structure

```text
.
├── main.tf
├── variables.tf
├── outputs.tf
├── providers.tf
├── terraform.tf
└── modules/
    ├── network/
    ├── instance/
    ├── storage/
    └── iam/
```

## Configuration

Create a `terraform.tfvars` file with the required variables.

Required variables:

- `admin_cidr`
- `storage_bucket_name`
- `tags`

See `terraform.tfvars.example` for reference.

## Modules

| Module | Responsibility |
|---|---|
| network | VPC, subnets and routing |
| instance | EC2 and security group |
| storage | S3 and KMS |
| iam | IAM role, policy and instance profile |

## Validation

```bash
terraform init
terraform fmt -recursive
terraform validate
```

## Deployment

Review the Terraform plan and all potential infrastructure changes
before any deployment.

## Cleanup

Review the resources and dependencies before performing any
destructive operation.
