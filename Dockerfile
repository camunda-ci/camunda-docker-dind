FROM camunda-ci1:5000/camunda-ci-base-ubuntu:latest

# add helper scripts
ADD bin/* /usr/local/bin/

# add docker repository
RUN add-repo.sh http://get.docker.io/ubuntu 36A1D7869245C8950F966E92D8576A8BA88D21E9 docker main

# install packages
RUN install-packages.sh make lxc lxc-docker iptables

# add camunda user to docker group
RUN usermod -aG docker camunda

# add supervisor conf
ADD etc/supervisor.d/* /etc/supervisor/conf.d/

# define additional metadata for our image.
VOLUME /var/lib/docker
