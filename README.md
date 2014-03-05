# Vagrant LAMP stack
A dead-simple LAMP stack without any bells and whistles for your basic Linux/Apache/MySQL/PHP install, using Chef Solo for provisioning.
The idea is for developers to fork this and add additional software and configuration that suits the needs of their project.

## Requirements
* [VirtualBox](https://www.virtualbox.org)
* [Vagrant](http://vagrantup.com)
* [Berkshelf](http://berkshelf.com)
	* `gem install berkshelf`
* [vagrant-berkshelf](https://github.com/riotgames/vagrant-berkshelf)
	* `vagrant plugin install vagrant-berkshelf`
* [vagrant-hostmanager](https://github.com/smdahlen/vagrant-hostmanager)
	* `vagrant plugin install vagrant-hostmanager`
