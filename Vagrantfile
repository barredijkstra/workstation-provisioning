# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/xenial64"
  config.vm.provision "shell", inline: "/vagrant/provision-vagrant.sh"

  config.vm.provider "virtualbox" do |vb|
      vb.gui = true
      vb.memory = "4096"
  end

end
