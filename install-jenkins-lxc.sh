#!/bin/bash

NAME=jenkins

lxc launch ubuntu: ${NAME}

lxc exec ${NAME} -- wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
lxc exec ${NAME} -- sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
lxc exec ${NAME} -- apt-get update
lxc exec ${NAME} -- apt-get install jenkins
