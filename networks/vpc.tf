module "vpc" {
    source  = "terraform-aws-modules/vpc/aws"
    version = "3.11.0"

    name = "${var.cluster_name}"
    cidr = "${var.vpc_cidr_block}"

    azs             = var.vpc_azs
    private_subnets = var.vpc_private_subnets
    public_subnets  = var.vpc_public_subnets

    enable_nat_gateway = true
    enable_vpn_gateway = true

    tags = {
        Terraform = "true"
        Environment = "${var.environment}"
    }
}
