# camunda Docker-in-Docker

Based on the [jpetazzo/dind](https://github.com/jpetazzo/dind) repository.

# Packages
  - oracle jdk 7
  - git
  - openssh server
  - supervisor
  - make
  - lxc
  - lxc-docker
  - iptables

# Users

## User: jenkins

  - username: jenkins
  - groups:   jenkins
  - password: jenkins

## SSH

To login as `jenkins` user the [jenkins-ci-insecure] key can be used.

[jenkins-ci-insecure]: https://github.com/camunda-ci/camunda-docker-ci-base-ubuntu/blob/master/keys/jenkins-ci-insecure
