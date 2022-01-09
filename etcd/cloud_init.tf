data "cloudinit_config" "user_data" {
  count = var.aws_instance_count

  part {
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/cloud-config.yml",
      {
        discovery_etcd_url = data.http.etcd-discovery-url.body
        instance_count = count.index
        etcd_version = var.etcd_version
      }
    )
  }
}
