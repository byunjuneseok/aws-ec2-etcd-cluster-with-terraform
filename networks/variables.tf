variable "aws_profile" {
  type = string
  description = "Profile of awscli"
  default = "default"
}

variable "cluster_name" {
  type = string
  description = "Cluster name"
}

variable "cluster_region" {
  type = string
  description = "Cluster region"
}

variable "environment" {
  type = string
  description = "Environment (dev, prod, ...)"
}

variable "vpc_cidr_block" {
  type = string
  description = "VPC CIDR block"
}

variable "vpc_azs" {
  type = list(string)
  description = "VPC availability zones"
}

variable "vpc_private_subnets" {
  type = list(string)
  description = "VPC private subnets"
}

variable "vpc_public_subnets" {
  type = list(string)
  description = "VPC public subnets"
}