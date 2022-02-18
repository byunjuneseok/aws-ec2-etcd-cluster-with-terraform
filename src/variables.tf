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

variable "key_path_pub" {
  description = "SSH public key path"
  default = "keys/id_rsa.pub"
}

variable "key_path_pem" {
  description = "SSH public key path"
  default = "keys/id_rsa.pem"
}

variable "bastion_instance_ami" {
  type = string
  description = "AMI for bastion EC2 instances"
}

variable "bastion_instance_type" {
  type = string
  description = "Instance type of bastion EC2 instances"
}

variable "bastion_connection_etcd_user" {
  type = string
  description = "Username for bastion connection. Depends on AMI for etcd instance. (`ubuntu`, `ec2-user` and so on)"
}

variable "bastion_connection_bastion_user" {
  type = string
  description = "Username for bastion connection. Depends on AMI for bastion instance. (`ubuntu`, `ec2-user` and so on)"
}

variable "etcd_instance_ami" {
  type = string
  description = "AMI for etcd EC2 instances"
}

variable "etcd_instance_type" {
  type = string
  description = "Instance type of etcd EC2 instances"
}

variable "etcd_instance_count" {
  type = number
  description = "Count of etcd instance(s), Usually the cluster size is 3, 5 or 7."
}

variable "etcd_version" {
  type = string
  description = "Version of etcd, starts with v"
  default = "v3.5.1"
}
