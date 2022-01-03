# `etcd` Cluster

## Objectives
- Provision etcd cluster

## Prerequisite
- terraform


## How to build
```
$ generate-ssh-key.sh
$ generate-discovery-etcd-url.sh
$ terraform init
$ terraform plan
$ terraform apply
```

## How to destroy
```
$ terraform destroy
```


## Reference
- https://cloudinit.readthedocs.io/en/latest/
- https://www.terraform.io/language/functions/templatefile
