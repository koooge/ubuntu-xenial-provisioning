#!/bin/bash -eu

install_apt_packages() {
  sudo apt-get -qq update
  sudo apt-get -y upgrade
  sudo apt-get install -y curl zip unzip bzip2 \
    gcc g++ make bison \
    vim global \
    tig tree jq dos2unix lv silversearcher-ag
}

install_bash_profile() {
  mkdir ${HOME}/.bash.d
  cp -p .bash_profile ${HOME}/
}

install_packages() {
  ./install_ruby.sh
  ./install_node.sh
  ./install_golang.sh
  ./install_java.sh
  ./install_docker.sh
}

install_services() {
  ./services/install_heroku.sh
}

install_apt_packages
install_bash_profile
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

install_packages
install_services
