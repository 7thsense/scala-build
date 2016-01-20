FROM 7thsense/java:8
MAINTAINER Erik LaBianca <erik@7thsense.io>
ADD bootstrap.sh /root/bootstrap.sh
RUN /root/bootstrap.sh
