# `etcd` Cluster

## Objectives
- Provision etcd cluster

## Prerequisite
- terraform


## How to build
```
$ generate-ssh-key.sh
$ terraform init
$ terraform plan
$ terraform apply
```

## How to destroy
```
$ terraform destroy
```

## TO-DO
- Certification


## Reference
- https://cloudinit.readthedocs.io/en/latest/
- https://www.terraform.io/language/functions/templatefile
- https://etcd.io/docs/v3.4/platforms/aws/
- https://etcd.io/docs/v3.4/op-guide/clustering/#etcd-discovery