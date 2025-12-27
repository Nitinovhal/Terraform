# VPC module

Simple VPC module that creates a VPC with public and private subnets, an Internet Gateway, and a public route table.

Inputs: `name`, `cidr`, `azs`, `public_subnet_cidrs`, `private_subnet_cidrs`.

Outputs: `vpc_id`, `public_subnet_ids`, `private_subnet_ids`.

This is a compact dev-friendly module; extend it with NAT gateways and additional route tables for production use.
