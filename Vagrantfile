# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Hostname
    config.vm.hostname = "elasticsearch"

    # Box OS
    config.vm.box = "ubuntu/xenial64"

    # Enable ports
    config.vm.network :forwarded_port, guest: 9200, host: 9200

    # Configure VirtualBox
    config.vm.provider "virtualbox" do |machine|
        machine.name = "elasticsearch"
        machine.memory = 4096
    end

    config.vm.provision :shell, :path => "bootstrap.sh"
end
