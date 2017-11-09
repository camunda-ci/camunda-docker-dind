FROM registry.camunda.com/camunda-ci-base-centos:jdk-8

# install packages
RUN install-packages.sh make device-mapper-libs.x86_64 bzip2

# set locale
ENV LANG=en_US.utf8 \
    LANGUAGE=en_US.utf8 \
    LC_ALL=en_US.utf8

RUN localedef -i en_US -f UTF-8 en_US.utf8
RUN save-env.sh LANG LANGUAGE LC_ALL

ADD bin/* /usr/local/bin/

# create volume to exchange data with another container
RUN su - camunda -c "mkdir -p /home/camunda/volume"
VOLUME /home/camunda/volume

CMD ["/usr/local/bin/start-container.sh"]
