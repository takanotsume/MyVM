# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
##########################

  # Vagrantfile API/syntax version.
  VAGRANTFILE_API_VERSION = "2"

  # IP Address for the host only network
  ip_address = "192.168.33.10"

  # The project name is base for directories, hostname and alike
  project_name = "myvagrant"

# Vagrant configuration
#################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Enable Berkshelf support
  config.berkshelf.enabled = true

  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.hostname =  project_name + ".local"
  config.vm.network :private_network, ip: ip_address
  config.hostmanager.aliases = [ "www." + project_name + ".local" ]
  config.vm.provision :hostmanager

  # Make sure that the newest version of Chef have been installed
  config.vm.provision :shell, :inline => "apt-get update -qq && apt-get install make ruby1.9.1-dev --no-upgrade --yes"
  config.vm.provision :shell, :inline => "gem install chef --version 11.6.0 --no-rdoc --no-ri --conservative"
  config.vm.provision :shell, :inline => "apt-get autoremove -y"

   # Enable and configure chef solo
    config.vm.provision :chef_solo do |chef|
      chef.add_recipe "app::packages"
      chef.json = {
        :app => {
          # Project name
          :name => project_name,

          # Server name and alias(es) for Apache vhost
          :server_name => project_name + ".local",
          :server_aliases => [ "www." + project_name + ".local" ],

          # Document root for Apache vhost
          :docroot => "/var/www/" + project_name + "/public",

          # General packages
          :packages => %w{ vim git screen curl },
   
        }
      }
    end

end
