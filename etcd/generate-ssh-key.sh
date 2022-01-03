#!/bin/bash

mkdir ./keys
ssh-keygen -b 2048 -t rsa -f ./keys/id_rsa -q -N ""
