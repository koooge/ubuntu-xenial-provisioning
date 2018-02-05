#!/bin/bash -e

# Usage `./install_golang.sh && source ~/.bash_profile`

GO_VERSION="1.9.3"

GO_URL=https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz

install_gvm() {
  echo ""
}

install_golang() {
  wget -O - ${GO_URL} | sudo tar zxC /usr/local

  cp ./.bash.d/go.sh ${HOME}/.bash.d/
  export PATH=$PATH:/usr/local/go/bin
  export GOPATH=$HOME/go
}

go_get_packages() {
  go get golang.org/x/tools/cmd/godoc
  go get golang.org/x/tools/cmd/goimports
  go get github.com/golang/dep/cmd/dep
#  go get golang.org/x/tools/cmd/gorename
#  go get golang.org/x/tools/cmd/guru

  go get github.com/golang/lint/golint
  go get github.com/motemen/gore
  go get github.com/motemen/ghq
	echo "[ghq]" >> ~/.gitconfig
	echo "	root = ${HOME}/ghq" >> ~/.gitconfig
  go get github.com/nsf/gocode
  go get github.com/rogpeppe/godef
#  go get github.com/jstemmer/gotags
  go get github.com/k0kubun/pp
#  go get github.com/pilu/fresh
  go get github.com/github/hub

  wget -O - https://github.com/peco/peco/releases/download/v0.5.1/peco_linux_amd64.tar.gz | tar zxf - -C /tmp/
  cp /tmp/peco_linux_amd64/peco ${GOPATH}/bin/
}

# install_gvm
install_golang
go_get_packages

go version
