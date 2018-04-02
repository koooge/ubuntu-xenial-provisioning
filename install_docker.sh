#!/bin/bash -e

# Usage: `./install_docker.sh`

COMPOSE_VER=1.20.1

## docker
install_docker() {
  sudo apt-get update
  sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

  sudo add-apt-repository \
         "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
         $(lsb_release -cs) \
         stable"

  sudo apt-get update
  sudo apt-get install -y docker-ce
  sudo systemctl start docker

  sudo gpasswd -a ${USER} docker
  sudo systemctl restart docker
}

## dockere-compose
install_docker_compose() {
  curl -L http://github.com/docker/compose/releases/download/${COMPOSE_VER}/docker-compose-`uname -s`-`uname -m` > /tmp/docker-compose
  chmod +x /tmp/docker-compose
  sudo mv /tmp/docker-compose /usr/local/bin/
}

install_docker
install_docker_compose

docker -v
docker-compose -v
