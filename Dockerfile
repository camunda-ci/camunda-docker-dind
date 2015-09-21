FROM registry.camunda.com/camunda-ci-base-centos:latest

# install packages
RUN install-packages.sh make device-mapper-libs.x86_64

ADD bin/* /usr/local/bin/

CMD ["/usr/local/bin/start-container.sh"]
