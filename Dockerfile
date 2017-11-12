FROM 7thsense/java:latest
MAINTAINER Erik LaBianca <erik@7thsense.io>
ADD bootstrap.sh /root/bootstrap.sh
RUN /bin/bash /root/bootstrap.sh
USER build
ADD .sbt-bootstrap /home/build/.sbt-bootstrap
WORKDIR /home/build/.sbt-bootstrap
RUN /bin/bash /home/build/.sbt-bootstrap/initialize.sh
WORKDIR /home/build
