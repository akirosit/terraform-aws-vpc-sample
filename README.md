# Terraform Module `vpc-sample` for AWS

This is a Terraform module for deploying a VPC on AWS.

## About This Module

It's been created for training purpose.

The module creates :

- 1 `aws_vpc`.
- 1 `aws_internet_gateway` attached to the VPC.
- 1 `aws_route_table` routing all traffic through the IGW.
- X `aws_subnet` within the VPC that are associated to the route table. The number of subnet is defined by the `subnet_count` variable.

## How to Use This Module

Basic Example :

```hcl
module "vpc" {
  source   = "akirosit/vpc-sample/aws"
  vpc_cidr = "10.1.0.0/16"
}
```

Defining the number of subnets (3 here) we want to create :

```hcl
module "vpc" {
  source       = "akirosit/vpc-sample/aws"
  vpc_cidr     = "10.1.0.0/16"
  subnet_count = 3
}
```
