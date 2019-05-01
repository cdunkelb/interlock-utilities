for i in {1..5}; do

docker stack deploy app$i -c - <<EOSTACK
version: "3.2"

services:
  demo:
    image: ehazlett/docker-demo
    deploy:
      replicas: 1
      labels:
        com.docker.lb.hosts: app$i.example.org
        com.docker.lb.network: demo-network
        com.docker.lb.port: 8080
    networks:
      - demo-network

networks:
  demo-network:
    driver: overlay
EOSTACK

done
