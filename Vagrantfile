# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.hostname = "elasticsearch"
    config.vm.box = "precise32"
    config.vm.box_url = "http://files.vagrantup.com/precise32.box"
    config.vm.network :forwarded_port, guest: 9200, host: 9200
    config.vm.provision :shell, :path => "bootstrap.sh"
end