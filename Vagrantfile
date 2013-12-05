Vagrant.configure("2") do |config|
  module_name = "onrails"
  current_dir = File.dirname(__FILE__)
  config.vm.box = "Centos 6.4 x64"
  config.vm.box_url = 'http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130427.box'
  config.vm.synced_folder current_dir, "/etc/puppet/modules/#{module_name}", nfs: false

  vm = {
    ip: '192.168.57.100',
    hostname: module_name,
  }

  config.vm.define vm[:hostname] do |dev|
    dev.vm.hostname = vm[:hostname]
    dev.vm.network :private_network, ip: vm[:ip]

    dev.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 1024]
    end
  end

  # uses puppet to configure the target machine
  config.vm.provision :puppet do |puppet|
    puppet.facter = {
      ipaddress: vm[:ip],
    }

    puppet.options = "--verbose --debug"
    puppet.module_path = ['spec/fixtures/modules']
    puppet.manifests_path = 'spec/fixtures/manifests'
    puppet.manifest_file  = 'init.pp'
  end
end
