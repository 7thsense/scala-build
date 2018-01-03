FROM amazonlinux:2
MAINTAINER Erik LaBianca <erik@7thsense.io>
ADD bootstrap.sh /root/bootstrap.sh
RUN /bin/bash /root/bootstrap.sh
WORKDIR /home/build
USER build
ADD .sbt-bootstrap /home/build/.sbt-bootstrap
WORKDIR /home/build/.sbt-bootstrap
RUN /bin/bash /home/build/.sbt-bootstrap/initialize.sh
RUN /usr/local/bin/coursier fetch \
    org.apache.spark:spark-sql_2.11:2.2.1 \
    org.apache.hadoop:hadoop-aws:2.7.5 \
    org.typelevel:cats-core_2.11:1.0.0 \
    org.typelevel:cats-core_2.12:1.0.0
USER root
ENTRYPOINT ["gosu", "build"]
CMD /bin/bash 
