resource "aws_key_pair" "etcd" {
  key_name = "${var.cluster_name}-etcd"
  public_key = "${file("${var.key_path}")}"

  tags = {
    Name = "${var.cluster_name}"
    Terraform = "true"
    Environment = "${var.environment}"
  }
}

resource "aws_instance" "etcd" {
  ami = "${var.aws_instance_ami}"
  instance_type = "${var.aws_instance_type}"
  key_name = aws_key_pair.etcd.id
  count = var.aws_instance_count
  vpc_security_group_ids = [aws_security_group.etcd.id]
  subnet_id = element(sort(data.aws_subnet_ids.public.ids), count.index)

  user_data = data.cloudinit_config.user_data[count.index].rendered

  tags = {
    Name = "${var.cluster_name}-etcd-${count.index}"
    Terraform = "true"
    Environment = "${var.environment}"
  }
}
