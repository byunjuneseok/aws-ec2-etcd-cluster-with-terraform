output "etcd_discovery" {
  value = data.http.etcd-discovery-url.body
  description = "etcd discovery url."
}