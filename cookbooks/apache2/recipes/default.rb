execute "Adding Apache 2" do
  command "apt-get install -y apache2"
end

execute "Adding apache headers module" do
  command "a2enmod alias rewrite setenvif headers expires"
end

execute "Disable apache2 default site" do
  command "a2dissite 000-default.conf"
end

template "/etc/apache2/sites-available/001-vm.conf" do
  source "001-vm.erb"
  variables({
     :server_name => node[:server_name],
     :server_aliases => node[:server_aliases],
     :docroot => node[:docroot]
  })
end

execute "Enable apache2 default site" do
  command "a2ensite 001-vm.conf"
end

service "apache2" do
  action :restart
end

