#!/usr/bin/env bash

vagrant init
vagrant plugin install vagrant-hostmanager vagrant-vbguest
vagrant up
cat .vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
ansible-playbook -i hosts.yml all.yml -v
