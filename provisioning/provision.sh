#!/bin/bash

apt-get update && apt-get install -y git python-pip python-dev
pip install ansible python-novaclient python-troveclient
echo "source .openrc" >> /home/vagrant/.bashrc
ln -s /vagrant/playbooks /home/vagrant/playbooks

