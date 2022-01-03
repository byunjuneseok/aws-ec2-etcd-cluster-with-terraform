resource "aws_security_group" "etcd" {
  name = "${var.cluster_name}-etcd"
  vpc_id = "${data.aws_vpc.cluster_vpc.id}"

  ingress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_name}"
    Terraform = "true"
    Environment = "${var.environment}"
  }
}