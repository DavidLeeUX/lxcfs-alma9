#!/bin/bash
docker build -t registry.cn-hangzhou.aliyuncs.com/library/lxcfs:5.0.4-0-alma9 lxcfs-image-9
#docker push registry.cn-hangzhou.aliyuncs.com/denverdino/lxcfs:3.1.2

./build-res
