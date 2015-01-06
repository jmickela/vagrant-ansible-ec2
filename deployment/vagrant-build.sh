#!/bin/bash

VAGRANT_PATH=/home/vagrant
ANSIBLE_PATH=$VAGRANT_PATH/deployment/
ANSIBLE_HOSTS=$VAGRANT_PATH/deployment/hosts

apt-get update
# Install some tools.
# apt-get install make git-core nano -y
apt-get install -y python-software-properties
add-apt-repository -y ppa:rquillo/ansible
apt-get update -qq
apt-get -y --force-yes install ansible
cp /vagrant/deployment/hosts /etc/ansible/hosts
ansible-playbook /vagrant/deployment/provision-vagrant.yml --connection=local