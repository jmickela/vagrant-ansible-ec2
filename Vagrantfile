Vagrant.configure("2") do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  
  config.vm.network :private_network, ip: "192.168.56.101"
    config.vm.network :forwarded_port, guest: 8000, host: 8000
    config.ssh.forward_agent = true

  config.vm.synced_folder "./app", "/home/vagrant/app", id: "app"
  config.vm.synced_folder "./app", "/home/vagrant/deployment", id: "deployment" 


  config.vm.provider :virtualbox do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--memory", 1024]
  end

  config.vm.provision :shell, :path => "deployment/vagrant-build.sh"
end