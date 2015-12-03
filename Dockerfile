FROM registry.camunda.com/camunda-ci-base-centos:latest

# install packages
RUN install-packages.sh make device-mapper-libs.x86_64

ADD bin/* /usr/local/bin/

# create volume to exchange data with another container
RUN su - camunda -c "mkdir -p /home/camunda/volume"
VOLUME /home/camunda/volume

CMD ["/usr/local/bin/start-container.sh"]
