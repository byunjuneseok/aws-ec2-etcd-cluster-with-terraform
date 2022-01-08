#!/bin/bash


# Set `size` query parameter with the numbers of cluster instances.
curl https://discovery.etcd.io/new?size=3 > discovery-etcd-url.txt
