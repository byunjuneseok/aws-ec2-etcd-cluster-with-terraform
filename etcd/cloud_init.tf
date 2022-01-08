data "cloudinit_config" "user_data" {
  count = var.aws_instance_count

  part {
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/cloud-config.tftpl",
      {
        cluster_name = var.cluster_name
        discovery_etcd_url = file("discovery-etcd-url.txt")
      }
    )
  }
}
