# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.define "standalone", primary: true do |standalone|
    config.vm.hostname = "standalone"
    standalone.vm.box = "puppet-vagrant-boxes.puppetlabs.com-centos-65-x64-virtualbox-puppet.box"

    operating_system = "centos"
    if ENV['OPERATING_SYSTEM'].nil?
      puts "OPERATING_SYSTEM environment variable not specified. Using #{operating_system} by default.\nTo specify it in bash: export OPERATING_SYSTEM=debian"
      config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
      config.vm.box = "puppet-vagrant-boxes.puppetlabs.com-centos-65-x64-virtualbox-puppet.box"
    elsif ENV['OPERATING_SYSTEM'] == 'debian'
      puts "WARNING: Debian specified. Here be dragons! https://github.com/IQSS/dataverse/issues/1059"
      config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/debian-73-x64-virtualbox-puppet.box"
      config.vm.box = "puppet-vagrant-boxes.puppetlabs.com-debian-73-x64-virtualbox-puppet.box"
    else
      operating_system = ENV['OPERATING_SYSTEM']
      puts "Not sure what do to with operating system: #{operating_system}"
      exit 1
    end

    mailserver = "localhost"
    if ENV['MAIL_SERVER'].nil?
      puts "MAIL_SERVER environment variable not specified. Using #{mailserver} by default.\nTo specify it in bash: export MAIL_SERVER=localhost"
    else
      mailserver = ENV['MAIL_SERVER']
      puts "MAIL_SERVER environment variable found, using #{mailserver}"
    end

    config.vm.provider "virtualbox" do |v|
      v.memory = 2048
      v.cpus = 1
    end
    
    config.vm.provision "shell", path: "scripts/vagrant/setup.ksh"

    #config.vm.network "private_network", type: "dhcp"
    config.vm.network "forwarded_port", guest: 8080, host: 8880
    config.vm.network "forwarded_port", guest: 8081, host: 8881

    config.vm.synced_folder "target", "/target"
    config.vm.synced_folder "scripts", "/scripts"
  end

end
