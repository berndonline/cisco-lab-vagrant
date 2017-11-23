# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.provider :libvirt do |domain|
    domain.management_network_address = "10.255.1.0/24"
    domain.management_network_name = "wbr1"
    domain.nic_adapter_count = 130
  end
  #Generating Ansible Host File at following location:
  #    ./.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "./helper_scripts/empty_playbook.yml"
  end

  ##### DEFINE VM for rtr-1 #####

  config.vm.define "rtr-1" do |device|
    device.vm.box = "iosv3"

    device.vm.provider :libvirt do |v|
      v.memory = 2048
      v.nic_model_type = "e1000"
    end
  config.vm.synced_folder '.', '/vagrant', disabled: true

    # NETWORK INTERFACES
      # link for Gig01 --> rtr-2:Gig3
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:01",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '8001',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '9001',
            :libvirt__iface_name => 'Gig01',
            auto_config: false

      # link for Gig02 --> rtr-3:Gig3
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:02",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '8002',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '9002',
            :libvirt__iface_name => 'Gig02',
            auto_config: false

  config.vm.boot_timeout = 400

  config.ssh.forward_agent = true
  config.ssh.guest_port = 22
  config.ssh.insert_key = false

end

  ##### DEFINE VM for rtr-2 #####
  
  config.vm.define "rtr-2" do |device|
    device.vm.box = "iosxe"

    device.vm.provider :libvirt do |v|
      v.memory = 2048
    end
  config.vm.synced_folder '.', '/vagrant', disabled: true

    # NETWORK INTERFACES
      # link for Gig2 --> rtr-2:Gig2
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:03",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '8013',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '9013',
            :libvirt__iface_name => 'Gig2',
            auto_config: false

    # NETWORK INTERFACES
      # link for Gig3 --> rtr-1:Gig01
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:04",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '9001',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '8001',
            :libvirt__iface_name => 'Gig3',
            auto_config: false

    # NETWORK INTERFACES
      # link for Gig4 --> rtr-4:Gig01
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:04",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '9003',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '8004',
            :libvirt__iface_name => 'Gig4',
            auto_config: false

  config.vm.boot_timeout = 400

  config.ssh.forward_agent = true
  config.ssh.guest_port = 22
  config.ssh.insert_key = false
end

  ##### DEFINE VM for rtr-3 #####
  
  config.vm.define "rtr-3" do |device|
    device.vm.box = "iosxe"

    device.vm.provider :libvirt do |v|
      v.memory = 2048
    end
  config.vm.synced_folder '.', '/vagrant', disabled: true

    # NETWORK INTERFACES
      # link for Gig2 --> rtr-2:Gig2
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:22",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '9013',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '8013',
            :libvirt__iface_name => 'Gig2',
            auto_config: false

    # NETWORK INTERFACES
      # link for Gig3 --> rtr-1:Gig02
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:04",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '9002',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '8002',
            :libvirt__iface_name => 'Gig3',
            auto_config: false

    # NETWORK INTERFACES
      # link for Gig4 --> rtr-4:Gig02
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:04",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '9004',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '8005',
            :libvirt__iface_name => 'Gig4',
            auto_config: false

  config.vm.boot_timeout = 400

  config.ssh.forward_agent = true
  config.ssh.guest_port = 22
  config.ssh.insert_key = false
end

  ##### DEFINE VM for rtr-4 #####

  config.vm.define "rtr-4" do |device|
    device.vm.box = "iosv3"

    device.vm.provider :libvirt do |v|
      v.memory = 2048
      v.nic_model_type = "e1000"
    end
  config.vm.synced_folder '.', '/vagrant', disabled: true

    # NETWORK INTERFACES
      # link for Gig01 --> rtr-2:Gig4
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:21",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '8004',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '9003',
            :libvirt__iface_name => 'Gig01',
            auto_config: false

      # link for Gig02 --> rtr-3:Gig4
      device.vm.network "private_network",
            :mac => "a0:00:00:00:00:21",
            :libvirt__tunnel_type => 'udp',
            :libvirt__tunnel_local_ip => '127.0.0.1',
            :libvirt__tunnel_local_port => '8005',
            :libvirt__tunnel_ip => '127.0.0.1',
            :libvirt__tunnel_port => '9004',
            :libvirt__iface_name => 'Gig02',
            auto_config: false

  config.vm.boot_timeout = 400

  config.ssh.forward_agent = true
  config.ssh.guest_port = 22
  config.ssh.insert_key = false
end

end

