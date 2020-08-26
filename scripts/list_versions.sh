#!/bin/bash

curl -s https://releases.hashicorp.com/terraform/ | grep -Po 'terraform/\K[^/"]*' | sed -E '/\d*.\d*.\d*-\.*/d' | awk '!seen[$0]++' | grep ${1:-.}
