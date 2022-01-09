resource "aws_alb" "etcd" {
  name = var.cluster_name
  load_balancer_type = "application"
  security_groups = [aws_security_group.etcd.id]
  subnets = module.vpc.private_subnets
  internal = true
}

resource "aws_alb_target_group" "etcd" {
  name = var.cluster_name
  port = "2379"
  protocol = "HTTP"
  vpc_id = module.vpc.vpc_id

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 10
    timeout             = 5
    interval            = 10
    path                = "/version"
    port                = "2379"
  }
}

resource "aws_alb_listener" "etcd" {
  load_balancer_arn = aws_alb.etcd.arn
  port = "2379"
  protocol = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.etcd.arn
    type = "forward"
  }
}

resource "aws_alb_target_group_attachment" "etcd" {
  count = var.etcd_instance_count
  target_group_arn = aws_alb_target_group.etcd.arn
  target_id        = aws_instance.etcd[count.index].id

}

output "aws_alb_dns_name" {
  value = aws_alb.etcd.dns_name
  description = "DNS name of ALB"
}