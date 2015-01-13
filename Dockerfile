FROM camunda-ci1:5000/ubuntu:14.04.1

# avoid debconf and initrd
ENV DEBIAN_FRONTEND=noninteractive \
    INITRD=No

# add helper scripts
ADD bin/* /usr/local/bin/

# add ppa:webupd8team/java and docker repository
RUN add-repo.sh http://ppa.launchpad.net/webupd8team/java/ubuntu EEA14886 && \
    add-repo.sh http://get.docker.io/ubuntu 36A1D7869245C8950F966E92D8576A8BA88D21E9 docker main && \
    echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# install packages and create necessary directories
RUN install-packages.sh git ca-certificates openssh-server supervisor make oracle-java7-installer lxc lxc-docker iptables && \
    mkdir -p /var/run/sshd /var/log/supervisor

# add supervisor conf
ADD etc/supervisor.d/* /etc/supervisor/conf.d/

# add jenkins user
ADD etc/ssh/authorized_keys /tmp/authorized_keys
RUN useradd -U -m -s /bin/bash jenkins && \
    echo "jenkins:jenkins" | chpasswd && \
    mkdir -p /home/jenkins/.ssh && \
    chmod 700 /home/jenkins/.ssh && \
    mv /tmp/authorized_keys /home/jenkins/.ssh/ && \
    chown -R jenkins:jenkins /home/jenkins/.ssh && \
    usermod -aG docker jenkins

# define additional metadata for our image.
VOLUME /var/lib/docker

# Expose ssh port
EXPOSE 22

CMD ["/usr/bin/supervisord"]
