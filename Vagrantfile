Vagrant.configure(2) do |config|
  config.vm.box = "centos-6.5-x86_64"
  config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140110.box"
  config.vm.network "private_network", ip: "192.168.33.109"
  config.ssh.forward_agent = true
  config.vm.provision :itamae do |config|
    config.sudo = true
    config.recipes = 'cookbooks/base/node_build.rb'
    config.json = 'nodes/vagrant.json'
  end
end