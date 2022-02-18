resource "tls_private_key" "etcd" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "etcd" {
  key_name = "${var.cluster_name}-etcd"
  public_key = tls_private_key.etcd.public_key_openssh

  tags = {
    Name = var.cluster_name
    Terraform = "true"
    Environment = var.environment
  }

  provisioner "local-exec" {
    command = <<-EOT
      echo '${tls_private_key.etcd.private_key_pem}' > ./'${self.key_name}'.pem
      chmod 400 ./'${self.key_name}'.pem
    EOT
  }
}

resource "aws_instance" "bastion" {
  ami = var.bastion_instance_ami
  instance_type = var.bastion_instance_type
  associate_public_ip_address = true
  key_name = aws_key_pair.etcd.id

  subnet_id = module.vpc.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.etcd.id]
  source_dest_check = false

  # customize
  user_data = data.cloudinit_config.bastion_instance.rendered

  tags = {
    Name = "${var.cluster_name}-bastion"
    Terraform = "true"
    Environment = var.environment
  }

}

resource "aws_instance" "etcd" {
  ami = var.etcd_instance_ami
  instance_type = var.etcd_instance_type
  key_name = aws_key_pair.etcd.id
  count = var.etcd_instance_count

  # network
  vpc_security_group_ids = [aws_security_group.etcd.id]
  subnet_id = element(sort(module.vpc.private_subnets), count.index)

  # bastion
  connection {
    host = self.private_ip
    port = "22"
    type = "ssh"
    user = var.bastion_connection_etcd_user
    private_key = file(var.key_path_pem)
    timeout = "2m"
    agent = false

    bastion_host = aws_instance.bastion.public_ip
    bastion_port = "22"
    bastion_user = "ec2-user"
    bastion_private_key = file(var.key_path_pem)
  }

  # customize
  user_data = data.cloudinit_config.etcd_instance[count.index].rendered

  tags = {
    Name = "${var.cluster_name}-etcd-${count.index}"
    Terraform = "true"
    Environment = var.environment
  }
}
