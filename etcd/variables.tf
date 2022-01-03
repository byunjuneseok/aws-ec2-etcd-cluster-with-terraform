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

variable "key_path" {
  description = "SSH public key path"
  default = "keys/id_rsa.pub"
}

variable "aws_instance_ami" {
  type = string
  description = "AMI for etcd EC2 instances"
}

variable "aws_instance_type" {
  type = string
  description = "Instance type of etcd EC2 instances"
}

variable "aws_instance_count" {
  type = number
  description = "Count of etcd instance(s)"
}
