#!/usr/bin/env bash

vagrant init
vagrant plugin install vagrant-hostmanager vagrant-vbguest
vagrant up
ansible-playbook -i hosts.yml all.yml -v