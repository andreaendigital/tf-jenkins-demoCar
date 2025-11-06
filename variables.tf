# Input variables for demoCar_1 infrastructure
# These variables are used across modules (networking, EC2, security groups)
# Customize via terraform.tfvars or CLI flags

# S3 bucket name for storing remote Terraform state
variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket used for remote Terraform state storage"
}

# VPC configuration
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the demoCar_1 VPC (e.g., 10.0.0.0/16)"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the demoCar_1 VPC"
}

# Subnet configuration
variable "cidr_public_subnet" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "cidr_private_subnet" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

# Availability Zones in us-east-1 (Free Tier region)
variable "eu_availability_zone" {
  type        = list(string)
  description = "List of availability zones for subnet distribution (e.g., us-east-1a, us-east-1b)"
}

# EC2 SSH key
variable "public_key" {
  type        = string
  description = "SSH public key used to access the EC2 instance"
}

# Amazon Linux 2023 AMI ID (Free Tier eligible)
variable "ec2_ami_id" {
  type        = string
  description = "AMI ID for Amazon Linux 2023"
}