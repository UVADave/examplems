# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "standalone", primary: true do |standalone|

    config.vm.hostname = "standalone"

    #standalone.vm.box = "hashicorp/precise32"
    #operating_system = "ubuntu"

    #standalone.vm.box = "puppetlabs/centos-7.0-64-puppet"
    #operating_system = "centos"

    standalone.vm.box = "puppetlabs/centos-6.6-32-puppet"
    operating_system = "centos"

    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
      v.gui = true
    end
   
    # provisioning... 
    config.vm.provision "shell", path: "scripts/vagrant/setup-centos.ksh"
    #config.vm.provision "shell", path: "scripts/vagrant/setup-ubuntu.ksh"

    # port forwarding...
    config.vm.network "forwarded_port", guest: 8080, host: 8880
    config.vm.network "forwarded_port", guest: 8081, host: 8881

    config.vm.synced_folder "target", "/target"
    config.vm.synced_folder "scripts", "/scripts"
  end

end
