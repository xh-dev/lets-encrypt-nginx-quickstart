#!/bin/bash
hostname=$1
port=$2
cat conf/full_conf_template | \
sed "s|{port}|$port|g"  | \
sed "s|{hostname}|$hostname|g" \
	> conf/$hostname.conf
