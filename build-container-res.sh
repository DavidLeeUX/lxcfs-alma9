#!/bin/bash
docker build -t lxcfs:3.1.2-changwei5-1 lxcfs-image
#docker push registry.cn-hangzhou.aliyuncs.com/denverdino/lxcfs:3.1.2

./build-res
