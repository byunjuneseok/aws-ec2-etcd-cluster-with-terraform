data "http" "etcd-discovery-url" {
  url = "https://discovery.etcd.io/new?size=${var.etcd_instance_count}"
}

data "cloudinit_config" "bastion_instance" {
  part {
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/bastion-cloud-config.yml",
      {
        etcd_version = var.etcd_version
      }
    )
  }
}


data "cloudinit_config" "etcd_instance" {
  count = var.etcd_instance_count

  part {
    content_type = "text/cloud-config"
    content = templatefile(
      "${path.module}/etcd-cloud-config.yml",
      {
        discovery_etcd_url = data.http.etcd-discovery-url.body
        instance_count = count.index
        etcd_version = var.etcd_version
      }
    )
  }
}

output "etcd_discovery" {
  value = data.http.etcd-discovery-url.body
  description = "etcd discovery url."
}
