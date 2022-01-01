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
