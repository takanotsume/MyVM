# -*- mode: ruby -*-
# vi: set ft=ruby :

# General project settings
##########################

  # Vagrantfile API/syntax version.
  VAGRANTFILE_API_VERSION = "2"

  # IP Address for the host only network
  ip_address = "192.168.33.10"

  # The project name is base for directories, hostname and alike
  project_name = "myvm"

# Vagrant configuration
#################################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "trusty64"
  config.vm.box_url = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"

  config.omnibus.chef_version = :latest

  # Set share folder
  config.vm.synced_folder "./" , "/var/www/" + project_name + "/", :mount_options => ["dmode=777", "fmode=666"]

  config.hostmanager.enabled = true
  config.hostmanager.manage_host = true
  config.vm.hostname =  project_name
  config.vm.network :private_network, ip: ip_address
  config.vm.provision :hostmanager

  # Make sure that the newest version of Chef have been installed
  config.vm.provision :shell, :inline => "apt-get update -qq"
  config.vm.provision :shell, :inline => "apt-get install -y ruby1.9.1 gem"
  config.vm.provision :shell, :inline => "apt-get autoremove -y"

   # Enable and configure chef solo
   config.vm.provision :chef_solo do |chef|

     chef.cookbooks_path = "cookbooks"
     chef.add_recipe "packages"
     chef.add_recipe "apache2"
     chef.add_recipe "php5"
     chef.add_recipe "mariadb"
     chef.add_recipe "redis"
     chef.add_recipe "varnish"
     chef.add_recipe "sass"

     chef.json = {
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
   end

end
