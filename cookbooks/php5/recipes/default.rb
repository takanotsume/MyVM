execute "Adding PHP5" do
  command "apt-get install -y php5 php5-curl php5-gd php5-json php5-mcrypt php5-mysql php5-memcached"
end

execute "Bug Fix mcrypt" do
  command "cp /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available/"
  command "php5enmod mcrypt"
end

service "apache2" do
  action :restart
end

