terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.70.0"
    }
    cloudinit = {
      source = "hashicorp/cloudinit"
      version = "2.2.0"
    }
  }
}

provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.cluster_region}"
}

provider "cloudinit" {
  # Configuration options
}