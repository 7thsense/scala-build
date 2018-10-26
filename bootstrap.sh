#!/usr/bin/env bash

curl -sL https://rpm.nodesource.com/setup_10.x | bash -

# install stuff we can get straight from yum
yum -y install docker wget curl gpg tar gzip which git gcc-c++ make sudo java-1.8.0-openjdk-devel nodejs nodejs-devel aws-cli

# work in /opt
cd /opt

# get sbt-extras
curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /usr/local/bin/sbt
chmod 0755 /usr/local/bin/sbt

# get coursier 
curl -L -o /usr/local/bin/coursier https://git.io/vgvpD && chmod +x /usr/local/bin/coursier

# get maven
MAVEN_VER=3.3.9
wget http://www.apache.org/dist/maven/maven-3/${MAVEN_VER}/binaries/apache-maven-${MAVEN_VER}-bin.tar.gz.asc
wget http://mirrors.sonic.net/apache/maven/maven-3/${MAVEN_VER}/binaries/apache-maven-${MAVEN_VER}-bin.tar.gz
wget http://www.apache.org/dist/maven/KEYS
gpg --import KEYS
gpg --verify apache-maven-${MAVEN_VER}-bin.tar.gz.asc apache-maven-${MAVEN_VER}-bin.tar.gz
tar -xvzf apache-maven-${MAVEN_VER}-bin.tar.gz
ln -sf /opt/apache-maven-${MAVEN_VER}/bin/mvn /usr/local/bin
rm apache-maven-${MAVEN_VER}-bin.tar.gz apache-maven-${MAVEN_VER}-bin.tar.gz.asc KEYS

# download and install gosu
arch=amd64
gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4
curl -o /usr/local/bin/gosu -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch"
curl -o /usr/local/bin/gosu.asc -fSL "https://github.com/tianon/gosu/releases/download/1.3/gosu-$arch.asc"
gpg --verify /usr/local/bin/gosu.asc
rm /usr/local/bin/gosu.asc
chmod +x /usr/local/bin/gosu

# clean up
yum clean all
rm -rf /var/cache/yum
rm -rf /tmp/*

# set up a user
useradd build --groups wheel
cat > /etc/sudoers.d/wheel <<-EOF
%wheel        ALL=(ALL)       NOPASSWD: ALL
EOF
chown -R build:build /home/build

