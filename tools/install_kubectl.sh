#!/bin/bash -ex

sudo apt-get update -qq && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
sudo bash -c 'echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list'
sudo apt-get update -qq
sudo apt-get install -y kubectl

echo "alias k='kubectl'" >> ~/.bash_profile
echo "source <(kubectl completion bash)" >> ~/.bash_profile
echo "complete -o default -F __start_kubectl k" >> ~/.bash_profile
