# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "Ubuntu 12.04 64bit"
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-server-1204-x64.box"

  # Fix for shared drive being mounted as read-only
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]

  config.vm.provision :puppet do |puppet|
    puppet.options = "--pluginsync"
    puppet.manifests_path = "manifests"
    puppet.module_path = "modules"
  end

  config.vm.define :web do |web_config|
    web_config.vm.forward_port 80, 8080
  end

  config.vm.define :db do |db_config|
    db_config.vm.forward_port 3306, 3306
    db_config.vm.manifest_file  = "db.pp"
  end

end
