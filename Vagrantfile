# -*- mode: ruby -*-
# vi: set ft=ruby :

unless Vagrant.has_plugin?("vagrant-vbguest")
  raise 'vagrant-vbguest is not installed!'
end

unless Vagrant.has_plugin?("vagrant-winnfsd")
  raise 'vagrant-winnfsd is not installed!'
end

unless Vagrant.has_plugin?("vagrant-proxyconf")
  raise 'vagrant-proxyconf is not installed!'
end

Vagrant.configure(2) do |config|
  config.vm.box = "geerlingguy/centos7" # used as it has cifs-utils installed

  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  
  config.proxy.http     = "http://10.0.2.2:3128/" # 10.0.2.2 is your machine's IP address, from VirtualBox's perspective 
  config.proxy.https    = "http://10.0.2.2:3128/" 
  config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2,10.0.2.15,192.168.99.,.local,minikube-registry"


  config.vm.define vm_name = "centos7" do |d|
    d.vm.provider "virtualbox" do |v|
      v.name = vm_name
      v.memory = 4096
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"] # support symlinks in mounts
    end
    $machineName = "centos7"
    d.vm.hostname = $machineName 
	
    d.vm.synced_folder "C:/projects", "/projects"

    d.ssh.insert_key = false
 
    d.vm.provision :shell, path: "post_install.sh"
  end    
  config.vm.network "forwarded_port", guest: 8343, host: 8343
  config.vm.network "forwarded_port", guest: 8300, host: 8300
end