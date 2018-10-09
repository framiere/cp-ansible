Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"
  config.vm.box_check_update = false
  config.vm.synced_folder '.', '/vagrant', disabled: true
  config.ssh.insert_key = false  

  if Vagrant.has_plugin?("vagrant-hostmanager")
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
  end

  if Vagrant.has_plugin?("vagrant-vbguest")
    config.vbguest.auto_update = true
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  N = 4
  (0..N-1).each do |node_id|
    config.vm.define "node#{node_id}" do |node|

      node.vm.hostname = "node#{node_id}"
      # node.vm.network "private_network", type: "dhcp"
      node.vm.network "private_network", ip: "192.168.77.#{20+node_id}"
      # Only execute once the Ansible provisioner,
      # when all the machines are up and ready.
      if node_id == N-1
        node.vm.provision :ansible do |ansible|
          # Disable default limit to connect to all the machines
          # If not disabled, only machine4 will be provisionned
          ansible.limit = "all"
          ansible.playbook = "playbook-vagrant.yml"
        end
      end
    end
  end
end
