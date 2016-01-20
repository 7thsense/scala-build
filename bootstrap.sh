#!/usr/bin/env bash
yum -y install wget curl gpg tar gzip which git gcc-c++ make

# work in /opt
cd /opt

# get sbt
curl -s https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /usr/local/bin/sbt
chmod 0755 /usr/local/bin/sbt

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

# get node
curl --silent --location https://rpm.nodesource.com/setup_5.x | bash -
yum -y install nodejs


# clean up
yum clean all
