
# Instance Module

## Overview

Creates the EC2 compute infrastructure and its associated
network security configuration.

The EC2 instance is deployed into the subnet supplied by
the root module and receives an IAM Instance Profile.

## Resources

- Security Group
- EC2 Instance
- Amazon Linux 2023 AMI data source

## Inputs

| Name | Description | Type |
|---|---|---|
| vpc_id | ID of the VPC | string |
| admin_cidr | CIDR allowed to access the instance through SSH | string |
| subnet_id | ID of the subnet where EC2 is deployed | string |
| instance_profile_name | Name of the IAM Instance Profile | string |

## Outputs

| Name | Description |
|---|---|
| security_group_id | ID of the Security Group |
| instance_id | ID of the EC2 instance |
| private_ip | Private IP address of the instance |
| public_ip | Public IP address of the instance |

## Usage

```hcl
module "instance" {
  source = "./modules/instance"

  vpc_id               = module.network.vpc_id
  subnet_id            = module.network.subnet_public_id
  admin_cidr           = var.admin_cidr
  instance_profile_name = module.iam.instance_profile_name
}
```

## Notes

The Security Group restricts SSH ingress to the configured
admin CIDR and permits outbound traffic.

The IAM Instance Profile is supplied by the IAM module.
