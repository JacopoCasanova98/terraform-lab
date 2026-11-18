
# Network Module

## Overview

Creates the network infrastructure required by the application.

The module provisions an AWS VPC, public and private subnets,
an Internet Gateway, route tables and route table associations.

## Resources

- VPC
- Public subnet
- Private subnet
- Internet Gateway
- Public route table and route
- Private route table
- Route table associations

## Inputs

| Name | Description | Type |
|---|---|---|
| vpc_cidr | CIDR block for the VPC | string |
| public_subnet_cidr | CIDR block for the public subnet | string |
| private_subnet_cidr | CIDR block for the private subnet | string |
| availability_zone | Availability Zone for the subnets | string |

## Outputs

| Name | Description |
|---|---|
| vpc_id | ID of the VPC |
| subnet_public_id | ID of the public subnet |
| subnet_private_id | ID of the private subnet |

## Usage

```hcl
module "network" {
  source = "./modules/network"

  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  availability_zone   = var.availability_zone
}
```

## Notes

The public subnet has a route to the Internet Gateway.
The private subnet does not have a NAT Gateway or another
configured outbound Internet route.
