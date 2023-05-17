#!/bin/bash
hostname=$1
port=$2
p=$(readlink -f $(dirname $0))
echo "hostname: $hostname, port: $port, path: $p"

restart_docker(){
  docker compose down
  docker compose up -d
}
./conf/create-half-config.sh $hostname $port
restart_docker
cat certbot_template | sed "s|{p}|${p}|g" | sed "s|{hostname}|${hostname}|g" | sed "s|{port}|${port}|g" > certbot.sh
chmod +x certbot.sh
./certbot.sh
rm certbot.sh
./conf/create-full-config.sh $hostname $port
restart_docker
