#!/bin/bash -ex

FLYWAY_VERSION=5.0.2

wget -O - https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}-linux-x64.tar.gz | tar zxf -
sudo mv flyway-* /usr/local/flyway

echo 'export PATH=$PATH:/usr/local/flyway' >> ~/.bash_profile
