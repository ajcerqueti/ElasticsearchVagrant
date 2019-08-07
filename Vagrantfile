# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    # Hostname
    config.vm.hostname = "elasticsearch"

    # Box OS
    config.vm.box = "ubuntu/xenial64"

    config.vm.network :forwarded_port, guest: 9200, host: 9200
    config.vm.provision :shell, :path => "bootstrap.sh"
end