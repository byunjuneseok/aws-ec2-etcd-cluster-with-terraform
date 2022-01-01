data "aws_vpc" "cluster_vpc" {
  tags = {
    Name = "${var.cluster_name}"
  }
}

data "aws_subnet_ids" "private" {
  vpc_id = "${data.aws_vpc.cluster_vpc.id}"
  tags = {
    Private = true
  }
}
