FROM amazonlinux:2
MAINTAINER Erik LaBianca <erik@7thsense.io>
ADD bootstrap.sh /root/bootstrap.sh
RUN /bin/bash /root/bootstrap.sh
WORKDIR /home/build
USER root
ENTRYPOINT ["gosu", "build"]
CMD /bin/bash 
