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
    http = {
      source = "hashicorp/http"
      version = "2.1.0"
    }
    tls = {
      source = "hashicorp/tls"
      version = "3.1.0"
    }
  }
}

provider "aws" {
  profile = var.aws_profile
  region  = var.cluster_region
}

provider "cloudinit" {
  # Configuration options
}

provider "http" {
  # Configuration options
}

provider "tls" {
  # Configuration options
}
