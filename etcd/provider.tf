provider "aws" {
  profile = "${var.aws_profile}"
  region  = "${var.cluster_region}"
}
